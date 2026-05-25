import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/daily_card/data/repositories/daily_card_repository_impl.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';
import 'package:sugarlife/features/daily_card/presentation/bloc/daily_card_bloc.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DailyCardScreen extends StatelessWidget {
  const DailyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    return RepositoryProvider<DailyCardRepository>(
      create: (context) =>
          DailyCardRepositoryImpl(Supabase.instance.client, userId),
      child: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) =>
                DailyCardBloc(context.read<DailyCardRepository>())
                  ..add(const DailyCardEvent.loadTodayCard()),
            child: _FloatingDialog(),
          );
        },
      ),
    );
  }
}

// Диалог с висячими кнопками под контейнером
class _FloatingDialog extends StatelessWidget {
  const _FloatingDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: const _DialogContent(),
    );
  }
}

class _DialogContent extends StatelessWidget {
  const _DialogContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyCardBloc, DailyCardState>(
      builder: (context, state) {
        return Container(
          width: 340,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              switch (state) {
                Loading() => const SizedBox(
                  height: 200,
                  child: LottieProgressIndicator(),
                ),
                Loaded(:final card, :final hasAnsweredToday) => _LoadedContent(
                  card: card,
                  hasAnsweredToday: hasAnsweredToday,
                ),
                Answered(:final isCorrect, :final explanation) =>
                  _AnsweredContent(
                    isCorrect: isCorrect,
                    explanation: explanation,
                  ),
                NoMoreCards() => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Карточки закончились,\nно скоро появятся новые факты!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Error(:final message) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text('Ошибка: $message'),
                ),
                _ => const SizedBox.shrink(),
              },

              const SizedBox(height: 20),

              // Кнопка закрытия
              TextButton(
                onPressed: () {
                  if (context.mounted) {
                    context.read<DailyCardBloc>().add(
                      const DailyCardEvent.close(),
                    );
                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey[700],
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: const Text('Закрыть'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadedContent extends StatefulWidget {
  final DailyCardEntity card;
  final bool hasAnsweredToday;

  const _LoadedContent({required this.card, required this.hasAnsweredToday});

  @override
  State<_LoadedContent> createState() => _LoadedContentState();
}

class _LoadedContentState extends State<_LoadedContent> {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _titleKey = GlobalKey();
  double _buttonTopPosition = 0;
  double _iconTopPosition = 0;
  bool _isMeasured = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measurePositions();
    });
  }

  void _measurePositions() {
    final RenderBox? containerRenderBox =
        _containerKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? titleRenderBox =
        _titleKey.currentContext?.findRenderObject() as RenderBox?;

    if (containerRenderBox != null && titleRenderBox != null) {
      final containerPosition = containerRenderBox.localToGlobal(Offset.zero);
      final containerHeight = containerRenderBox.size.height;
      final titlePosition = titleRenderBox.localToGlobal(Offset.zero);

      setState(() {
        _buttonTopPosition = containerPosition.dy + containerHeight + 30;
        _iconTopPosition = titlePosition.dy - 40; // На 40px выше заголовка
        _isMeasured = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Контейнер с вопросом
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              key: _containerKey,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Text(
                widget.card.question,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            if (widget.hasAnsweredToday)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Вы уже отвечали на эту карточку сегодня',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),

        // Висячая иконка над заголовком
        if (_isMeasured)
          Positioned(
            left: 0,
            right: 0,
            top: _iconTopPosition,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/daily/truefalse.svg',
                    width: 190,
                    height: 95,
                  ),
                ),
              ),
            ),
          ),

        // Висячие кнопки (по центру экрана)
        if (!widget.hasAnsweredToday && _isMeasured)
          Positioned(
            left: 0,
            right: 0,
            top: _buttonTopPosition,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FloatingButton(
                    text: 'Правда',
                    color: Colors.green,
                    onPressed: () {
                      context.read<DailyCardBloc>().add(
                        DailyCardEvent.answerCard(
                          cardId: widget.card.id,
                          isCorrect: !widget.card.isMyth,
                          explanation: widget.card.explanation,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 28),
                  _FloatingButton(
                    text: 'Миф',
                    color: Colors.red,
                    onPressed: () {
                      context.read<DailyCardBloc>().add(
                        DailyCardEvent.answerCard(
                          cardId: widget.card.id,
                          isCorrect: widget.card.isMyth,
                          explanation: widget.card.explanation,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// Висячая кнопка
class _FloatingButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _FloatingButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        elevation: 4,
        fixedSize: const Size(140, 50),
      ),

      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _AnsweredContent extends StatelessWidget {
  final bool isCorrect;
  final String explanation;

  const _AnsweredContent({required this.isCorrect, required this.explanation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? Colors.green : Colors.red,
          size: 56,
        ),
        const SizedBox(height: 12),
        Text(
          isCorrect ? 'Верно!' : 'Неверно',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            children: [
              const Text(
                'Объяснение',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                explanation,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.5, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
