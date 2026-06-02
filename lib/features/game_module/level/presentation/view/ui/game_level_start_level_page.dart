import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class GameLevelStartLevelPage extends StatelessWidget {
  final int levelId;
  final int orderIndex;
  final int theoryModuleId;
  const GameLevelStartLevelPage({
    required this.levelId,
    required this.orderIndex,
    required this.theoryModuleId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameModuleLevelBloc>().state;
    if (state is! ReceiveSuccess) {
      return const SizedBox.shrink();
    }

    final progress = state.progress;
    final isCompleted = progress?.isCompleted ?? false;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MainAppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.blue,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: isCompleted
          ? _CompletedLevelContent(
              levelId: levelId,
              orderIndex: orderIndex,
              theoryModuleId: theoryModuleId,
              stars: progress?.stars ?? 0,
              questionsCount: state.questions.length,
            )
          : _NewLevelContent(
              levelId: levelId,
              orderIndex: orderIndex,
              theoryModuleId: theoryModuleId,
              questionsCount: state.questions.length,
            ),
    );
  }
}

// Класс для пройденного уровня
class _CompletedLevelContent extends StatelessWidget {
  final int levelId;
  final int orderIndex;
  final int theoryModuleId;
  final int stars;
  final int questionsCount;

  const _CompletedLevelContent({
    required this.levelId,
    required this.orderIndex,
    required this.theoryModuleId,
    required this.stars,
    required this.questionsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          Text(
            'Уровень $orderIndex',
            style: GoogleFonts.rubik(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'модуль $theoryModuleId',
            style: GoogleFonts.rubik(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Text(
            'Лучший результат:',
            style: GoogleFonts.rubik(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 13,
            runSpacing: 0,
            alignment: WrapAlignment.center,
            children: List.generate(3, (index) {
              return index < stars
                  ? SvgPicture.asset(
                      'assets/common/star_fill.svg',
                      width: 70,
                      height: 70,
                      colorFilter: const ColorFilter.mode(
                        AppColors.blue,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/common/star_border.svg',
                      width: 70,
                      height: 70,
                      colorFilter: const ColorFilter.mode(
                        AppColors.blue,
                        BlendMode.srcIn,
                      ),
                    );
            }),
          ),
          Spacer(),
          Center(
            child: SizedBox(
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
                onPressed: () {
                  context.read<GameModuleLevelBloc>().add(
                    GameModuleLevelEvent.startLevel(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Пройти заново',
                    style: GoogleFonts.rubik(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

// Класс для нового уровня
class _NewLevelContent extends StatelessWidget {
  final int levelId;
  final int orderIndex;
  final int theoryModuleId;
  final int questionsCount;

  const _NewLevelContent({required this.levelId, required this.questionsCount, required this.orderIndex, required this.theoryModuleId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          Text(
            'Уровень $orderIndex', // orderIndex
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'модуль $theoryModuleId', // moduleId
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Количество вопросов:',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              // Первая строка (всегда 3, если вопросов меньше - сколько есть)
              Wrap(
                spacing: 12,
                alignment: WrapAlignment.center,
                children: List.generate(
                  questionsCount >= 2 ? 2 : questionsCount,
                  (index) {
                    return SvgPicture.asset(
                      'assets/common/question_mon_icon.svg',
                      width: 85,
                      height: 85,
                    );
                  },
                ),
              ),
              if (questionsCount > 2) const SizedBox(height: 12),
              if (questionsCount > 2)
                Wrap(
                  spacing: 12,
                  alignment: WrapAlignment.center,
                  children: List.generate(questionsCount - 2, (index) {
                    return SvgPicture.asset(
                      'assets/common/question_mon_icon.svg',
                      width: 85,
                      height: 85,
                    );
                  }),
                ),
            ],
          ),
          Spacer(),
          Center(
            child: SizedBox(
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
                onPressed: () {
                  context.read<GameModuleLevelBloc>().add(
                    GameModuleLevelEvent.startLevel(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'НАЧАТЬ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.background,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
