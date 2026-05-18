import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/daily_card/data/repositories/daily_card_repository_impl.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';
import 'package:sugarlife/features/daily_card/presentation/bloc/daily_card_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';

class DailyCardScreen extends StatelessWidget {
  const DailyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    return RepositoryProvider<DailyCardRepository>(
  create: (context) => DailyCardRepositoryImpl(Supabase.instance.client, userId),
  child: Builder(
    builder: (context) {
      return BlocProvider(
        create: (context) => DailyCardBloc(context.read<DailyCardRepository>())
          ..add(const DailyCardEvent.loadTodayCard()),
        child: const Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: _DialogContent(),
        ),
      );
    },
  ),
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Заголовок
              Text(
                'Ежедневная карточка',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 16),

              switch (state) {
                Loading() => const CircularProgressIndicator(),
                Loaded(:final card, :final hasAnsweredToday) => _LoadedContent(
                  card: card,
                  hasAnsweredToday: hasAnsweredToday,
                ),
                Answered(:final isCorrect, :final explanation) =>
                  _AnsweredContent(
                    isCorrect: isCorrect,
                    explanation: explanation,
                  ),
                NoMoreCards() => const Text(
                  'Карточки закончились, но скоро появятся новые факты!',
                  textAlign: TextAlign.center,
                ),
                Error(:final message) => AppErrorView(
                  message: message,
                  compact: true,
                  onRetry: () => context.read<DailyCardBloc>().add(
                    const DailyCardEvent.loadTodayCard(),
                  ),
                ),
                _ => const SizedBox.shrink(),
              },

              const SizedBox(height: 16),

              // Кнопка закрытия всегда есть
              ElevatedButton(
                onPressed: () {
                  if (context.mounted) {
                    context.read<DailyCardBloc>().add(
                      const DailyCardEvent.close(),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Закрыть',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadedContent extends StatelessWidget {
  final DailyCardEntity card;
  final bool hasAnsweredToday;

  const _LoadedContent({required this.card, required this.hasAnsweredToday});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          card.question,
          style: const TextStyle(fontSize: 18, height: 1.4),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        if (!hasAnsweredToday) ...[
          Row(
            children: [
              Expanded(
                child: _AnswerButton(
                  text: 'Правда',
                  isCorrect: !card.isMyth,
                  color: Colors.green,
                  onPressed: () {
                    context.read<DailyCardBloc>().add(
                      DailyCardEvent.answerCard(
                        cardId: card.id,
                        isCorrect: !card.isMyth,
                        explanation: card.explanation,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _AnswerButton(
                  text: 'Ложь',
                  isCorrect: card.isMyth,
                  color: Colors.red,
                  onPressed: () {
                    context.read<DailyCardBloc>().add(
                      DailyCardEvent.answerCard(
                        cardId: card.id,
                        isCorrect: card.isMyth,
                        explanation: card.explanation,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Выберите "Правда" если утверждение верно, или "Ложь" если неверно',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
        if (hasAnsweredToday)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Вы уже отвечали на эту карточку сегодня',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
      ],
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
          size: 48,
        ),
        const SizedBox(height: 12),
        Text(
          isCorrect ? 'Правильно! 🎉' : 'Неправильно 😔',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const Text(
                'Объяснение:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                explanation,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String text;
  final bool isCorrect;
  final Color color;
  final VoidCallback onPressed;

  const _AnswerButton({
    required this.text,
    required this.isCorrect,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}