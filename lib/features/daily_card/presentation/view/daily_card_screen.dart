import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
            child: Builder(
              builder: (dialogContext) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      child: _DialogContent(),
                    ),
                    Positioned(
                      top: 12,
                      right: 18,
                      child: GestureDetector(
                        onTap: () {
                          dialogContext.read<DailyCardBloc>().add(
                            const DailyCardEvent.close(),
                          );
                          if (dialogContext.mounted) {
                            Navigator.pop(dialogContext);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.cancel,
                              color: AppColors.background,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
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
            color: AppColors.background,
            border: Border.all(color: AppColors.blue, width: 4),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              switch (state) {
                Loading() => const LottieProgressIndicator(),
                Loaded(:final card, :final hasAnsweredToday) => _LoadedContent(
                  card: card,
                  hasAnsweredToday: hasAnsweredToday,
                ),
                Answered(:final isCorrect, :final explanation, :final isMyth) =>
                  _AnsweredContent(
                    isCorrect: isCorrect,
                    explanation: explanation,
                    isMyth: isMyth,
                  ),
                NoMoreCards() =>  Text(
                  'Карточки закончились, но скоро появятся новые факты!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
                Error(:final message) => Text(
                  'Ошибка загрузки карточки. Проверьте интернет соединение',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
                _ => const SizedBox.shrink(),
              },
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
        SizedBox(
          width: 190,
          height: 95,
          child: SvgPicture.asset(
            'assets/common/daily_icon.svg',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          card.question,
          style: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        if (!hasAnsweredToday) ...[
          Row(
            children: [
              Expanded(
                child: _AnswerButton(
                  text: 'правда',
                  isCorrect: !card.isMyth,
                  color: AppColors.green,
                  onPressed: () {
                    context.read<DailyCardBloc>().add(
                      DailyCardEvent.answerCard(
                        cardId: card.id,
                        isCorrect: !card.isMyth,
                        explanation: card.explanation,
                        isMyth: card.isMyth,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _AnswerButton(
                  text: 'миф',
                  isCorrect: card.isMyth,
                  color: AppColors.red,
                  onPressed: () {
                    context.read<DailyCardBloc>().add(
                      DailyCardEvent.answerCard(
                        cardId: card.id,
                        isCorrect: card.isMyth,
                        explanation: card.explanation,
                        isMyth: card.isMyth,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
  final bool isMyth;

  const _AnsweredContent({
    required this.isCorrect,
    required this.explanation,
    required this.isMyth,
  });

  @override
  Widget build(BuildContext context) {
    String resultText;
    String animationPath;
    if (isCorrect) {
      resultText = isMyth ? 'ВЕРНО\n ЭТО МИФ' : 'ВЕРНО\n ЭТО ПРАВДА';
      animationPath = 'assets/animations/correct_animation.json'; 
    } else {
      resultText = isMyth ? 'НЕВЕРНО\n ЭТО МИФ' : 'НЕВЕРНО\n ЭТО ПРАВДА';
      animationPath = 'assets/animations/wrong_animation.json';
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 110,
          child: Lottie.asset(
            animationPath,
            repeat: false,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          resultText,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: isCorrect ? AppColors.truth : AppColors.myth,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'ОБЪЯСНЕНИЕ',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w700,
            color: AppColors.darkBlue,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          explanation,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlue,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 22),
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
        foregroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: Text(
        text,
        style: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}
