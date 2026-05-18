import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/errors/error_mapper.dart';
import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_list_repository.dart';
import 'package:sugarlife/features/game_module/list/presentation/bloc/game_module_list_bloc.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

part 'game_module_level_bloc.freezed.dart';
part 'game_module_level_event.dart';
part 'game_module_level_state.dart';

class _PendingLevelCompletion {
  const _PendingLevelCompletion({
    required this.levelId,
    required this.stars,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.unlockedAchievement,
  });

  final int levelId;
  final int stars;
  final int correctAnswers;
  final int totalQuestions;
  final AchievementEntity? unlockedAchievement;
}

class GameModuleLevelBloc
    extends Bloc<GameModuleLevelEvent, GameModuleLevelState> {
  final GameModuleLevelRepository _gameModuleLevelRepository;
  final GameModuleLevelListRepository _gameModuleLevelListRepository;
  final LevelProgressRepository _levelProgressRepository;
  final GameModuleListBloc _gameModuleListBloc;
  final AchievementRepository _achievementRepository;
  _PendingLevelCompletion? _pendingCompletion;

  GameModuleLevelBloc({
    required GameModuleLevelRepository gameModuleLevelRepository,
    required GameModuleLevelListRepository gameModuleLevelListRepository,
    required LevelProgressRepository levelProgressRepository,
    required GameModuleListBloc gameModuleListBloc,
    required AchievementRepository achievementRepository,
  }) : _gameModuleLevelRepository = gameModuleLevelRepository,
       _gameModuleLevelListRepository = gameModuleLevelListRepository,
       _levelProgressRepository = levelProgressRepository,
       _gameModuleListBloc = gameModuleListBloc,
       _achievementRepository = achievementRepository,
       super(const _Initial()) {
    on<GameModuleLevelEvent>(
      (event, emit) => switch (event) {
        _Receive(:final levelId) => _receiveGameLevel(
          emit: emit,
          levelId: levelId,
        ),
        _AnswerMultipleChoice(:final answer) => _answerMultipleChoice(
          emit: emit,
          answer: answer,
        ),
        _AnswerTrueFalse(:final answer) => _answerTrueFalse(
          emit: emit,
          answer: answer,
        ),
        _AnswerFillBlank(:final answer) => _answerFillBlank(
          emit: emit,
          answer: answer,
        ),
        _AnswerMultipleSelect(:final selectedIndices) => _answerMultipleSelect(
          emit: emit,
          selectedIndices: selectedIndices,
        ),
        _NextQuestion() => _nextQuestions(emit: emit),
        _RetryCompleteLevel() => _retryCompleteLevel(emit: emit),
        _RetryLevel() => _retryLevel(emit: emit),
        _StartLevel() => _startLevel(emit: emit),
      },
    );
  }
  Future<void> _receiveGameLevel({
    required Emitter<GameModuleLevelState> emit,
    required int levelId,
  }) async {
    emit(const ReceiveInProgress(message: 'Получение вопросов'));
    try {
      final results = await loadWithRetry(() async {
        final progress = _levelProgressRepository.getLevelProgress(
          levelId: levelId,
        );
        final questions = _gameModuleLevelRepository.getQuestionsForLevel(
          levelId: levelId,
        );
        return Future.wait([questions, progress]);
      });
      final questionsResult = results[0] as List<GameModuleQuestionEntity>;
      final progressResult = results[1] as LevelProgressEntity?;
      emit(
        ReceiveSuccess(
          questions: questionsResult,
          currentIndex: -1,
          progress: progressResult,
          isAnswered: false,
          answers: {},
        ),
      );
    } catch (e) {
      emit(
        ReceiveFailed(
          message: ErrorMapper.toUserMessage(
            e,
            loadContext: ErrorMessages.loadFailed,
          ),
        ),
      );
    }
  }

  Future<void> _answerMultipleChoice({
    required Emitter<GameModuleLevelState> emit,
    required String answer,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final currentQuestion = successState.questions[successState.currentIndex];
    final isCorrect = currentQuestion.isAnswerCorrect(answer);
    final newAnswers = Map<int, bool>.from(successState.answers);
    newAnswers[successState.currentIndex] = isCorrect;
    emit(successState.copyWith(isAnswered: true, answers: newAnswers));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answer,
        correctAnswer: currentQuestion.correctAnswer ?? '',
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
        answers: newAnswers,
      ),
    );
  }

  Future<void> _answerTrueFalse({
    required Emitter<GameModuleLevelState> emit,
    required bool answer,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final currentQuestion = successState.questions[successState.currentIndex];
    final isCorrect = currentQuestion.isAnswerCorrect(answer);
    final answerAsString = answer ? 'true' : 'false';
    final newAnswers = Map<int, bool>.from(successState.answers);
    newAnswers[successState.currentIndex] = isCorrect;
    emit(successState.copyWith(isAnswered: true, answers: newAnswers));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answerAsString,
        correctAnswer: currentQuestion.correctAnswer ?? '',
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
        answers: newAnswers,
      ),
    );
  }

  Future<void> _answerFillBlank({
    required Emitter<GameModuleLevelState> emit,
    required String answer,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final currentQuestion = successState.questions[successState.currentIndex];
    final isCorrect = currentQuestion.isAnswerCorrect(answer);
    final newAnswers = Map<int, bool>.from(successState.answers);
    newAnswers[successState.currentIndex] = isCorrect;
    emit(successState.copyWith(isAnswered: true, answers: newAnswers));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answer,
        correctAnswer: currentQuestion.correctAnswer ?? '',
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
        answers: newAnswers,
      ),
    );
  }

  Future<void> _answerMultipleSelect({
    required Emitter<GameModuleLevelState> emit,
    required List<int> selectedIndices,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final currentQuestion = successState.questions[successState.currentIndex];
    final isCorrect = currentQuestion.isAnswerCorrect(selectedIndices);
    final newAnswers = Map<int, bool>.from(successState.answers);
    newAnswers[successState.currentIndex] = isCorrect;
    emit(successState.copyWith(isAnswered: true, answers: newAnswers));
    // Формирование текста правильного ответа для отображения
    String correctAnswerText = '';
    var indices = currentQuestion.correctAnswerIndices;
    if (indices == null || indices.isEmpty) {
      final raw = currentQuestion.correctAnswer;
      if (raw != null && raw.isNotEmpty) {
        indices = raw
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .whereType<int>()
            .toList();
      }
    }
    if (indices != null && indices.isNotEmpty) {
      final correctAnswers = indices
          .where((i) => i >= 0 && i < currentQuestion.answers.length)
          .map((index) => currentQuestion.answers[index])
          .toList();
      correctAnswerText = correctAnswers.join(', ');
    }
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: selectedIndices
          .map((i) => currentQuestion.answers[i])
          .toList()
          .join(', '),
        correctAnswer: correctAnswerText,
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
        answers: newAnswers,
      ),
    );
  }

  Future<void> _nextQuestions({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    int currentIndex;
    List<GameModuleQuestionEntity> questions;
    LevelProgressEntity? progress;
    Map<int, bool> answers;

    if (state is ReceiveSuccess) {
      currentIndex = (state as ReceiveSuccess).currentIndex;
      questions = (state as ReceiveSuccess).questions;
      progress = (state as ReceiveSuccess).progress;
      answers = (state as ReceiveSuccess).answers;
    } else if (state is AnswerInProgress) {
      currentIndex = (state as AnswerInProgress).currentIndex;
      questions = (state as AnswerInProgress).questions;
      progress = (state as AnswerInProgress).progress;
      answers = (state as AnswerInProgress).answers;
    } else {
      return;
    }

    final nextIndex = currentIndex + 1;
    if (nextIndex < questions.length) {
      emit(
        ReceiveSuccess(
          questions: questions,
          currentIndex: nextIndex,
          progress: progress,
          isAnswered: false,
          answers: answers,
        ),
      );
    } else {
      final correctCount = answers.values.where((correct) => correct).length;
      final levelId = questions.first.levelId;
      final stars = _calculateStars(correctCount);

      emit(const GameModuleLevelState.completingLevel());

      _pendingCompletion = _PendingLevelCompletion(
        levelId: levelId,
        stars: stars,
        correctAnswers: correctCount,
        totalQuestions: questions.length,
        unlockedAchievement: null,
      );

      await _finishLevel(emit: emit);
    }
  }

  int _calculateStars(int correctCount) {
    if (correctCount >= 3) return 3;
    if (correctCount == 2) return 2;
    if (correctCount == 1) return 1;
    return 0;
  }

  Future<void> _finishLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    final pending = _pendingCompletion;
    if (pending == null) {
      emit(
        GameModuleLevelState.levelCompletionFailed(
          message: ErrorMessages.unknown,
        ),
      );
      return;
    }

    try {
      final shouldUnlockAchievement = pending.stars > 0
          ? await _shouldGrantModuleAchievement(
              levelId: pending.levelId,
              stars: pending.stars,
            )
          : false;

      await _levelProgressRepository.saveLevelProgress(
        levelId: pending.levelId,
        stars: pending.stars,
        correctAnswers: pending.correctAnswers,
      );

      AchievementEntity? unlockedAchievement;
      if (shouldUnlockAchievement) {
        try {
          unlockedAchievement = await _achievementRepository
              .unlockRandomAchievement()
              .timeout(const Duration(seconds: 15));
        } on TimeoutException {
          unlockedAchievement = null;
        }
      }

      _gameModuleListBloc.add(
        GameModuleListEvent.levelCompleted(
          levelId: pending.levelId,
          stars: pending.stars,
          correctAnswers: pending.correctAnswers,
          totalQuestions: pending.totalQuestions,
        ),
      );
      _pendingCompletion = null;
      emit(
        LevelCompleted(
          levelId: pending.levelId,
          correctAnswers: pending.correctAnswers,
          totalQuestions: pending.totalQuestions,
          stars: pending.stars,
          unlockedAchievement: unlockedAchievement,
        ),
      );
    } catch (e) {
      emit(
        GameModuleLevelState.levelCompletionFailed(
          message: ErrorMapper.toUserMessage(
            e,
            saveContext: ErrorMessages.saveFailed,
          ),
        ),
      );
    }
  }

  Future<void> _retryCompleteLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    if (_pendingCompletion == null) return;
    emit(const GameModuleLevelState.completingLevel());
    await _finishLevel(emit: emit);
  }

  /// Достижение выдаётся при первом полном прохождении теоретического модуля.
  Future<bool> _shouldGrantModuleAchievement({
    required int levelId,
    required int stars,
  }) async {
    try {
      final currentLevel = await _gameModuleLevelListRepository
          .getLevelById(levelId: levelId)
          .timeout(const Duration(seconds: 10));
      final allLevels = await _gameModuleLevelListRepository
          .getAllLevels()
          .timeout(const Duration(seconds: 10));
      final moduleLevels =
          allLevels
              .where(
                (level) => level.theoryModuleId == currentLevel.theoryModuleId,
              )
              .toList()
            ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

      if (moduleLevels.isEmpty || stars <= 0) {
        return false;
      }

      final progressMap = await _levelProgressRepository
          .getAllLevelsProgress()
          .timeout(const Duration(seconds: 10));

      bool isLevelPassed(int id) {
        final progress = progressMap[id];
        return progress != null && (progress.stars ?? 0) > 0;
      }

      final currentAlreadyPassed = isLevelPassed(levelId);

      // Остальные уровни модуля уже были пройдены до этого захода.
      final otherLevelsPassed = moduleLevels
          .where((level) => level.id != levelId)
          .every((level) => isLevelPassed(level.id));

      // Модуль закрывается впервые: последний непройденный уровень сейчас завершён.
      return otherLevelsPassed && stars > 0 && !currentAlreadyPassed;
    } catch (e) {
      print('Ошибка проверки выдачи достижения: $e');
      return false;
    }
  }

  Future<void> _retryLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final levelId = successState.questions.first.levelId;
    await _receiveGameLevel(emit: emit, levelId: levelId);
  }

  Future<void> _startLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    if (state is! ReceiveSuccess) return;
    final currentState = state as ReceiveSuccess;
    emit(
      ReceiveSuccess(
        questions: currentState.questions,
        currentIndex: 0,
        progress: currentState.progress,
        isAnswered: false,
        answers: {},
      ),
    );
  }
}
