import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/game_module_level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module_level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/profile/domain/entities/level_progress_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/level_progress_repository.dart';

part 'game_module_level_bloc.freezed.dart';
part 'game_module_level_event.dart';
part 'game_module_level_state.dart';

class GameModuleLevelBloc
    extends Bloc<GameModuleLevelEvent, GameModuleLevelState> {
  final GameModuleLevelRepository _gameModuleLevelRepository;
  final LevelProgressRepository _levelProgressRepository;
  GameModuleLevelBloc({
    required GameModuleLevelRepository gameModuleLevelRepository,
    required LevelProgressRepository levelProgressRepository,
  }) : _gameModuleLevelRepository = gameModuleLevelRepository,
       _levelProgressRepository = levelProgressRepository,
       super(const _Initial()) {
    on<GameModuleLevelEvent>(
      (event, emit) => switch (event) {
        _Receive(:final levelId, :final ageCategory) => _receiveGameLevel(
          emit: emit,
          levelId: levelId,
          ageCategory: ageCategory,
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
        _NextQuestion() => _nextQuestions(emit: emit),
        _RetryLevel() => _retryLevel(emit: emit),
        _StartLevel() => _startLevel(emit: emit),
      },
    );
  }
  Future<void> _receiveGameLevel({
    required Emitter<GameModuleLevelState> emit,
    required int levelId,
    required AgeCategory ageCategory,
  }) async {
    emit(const ReceiveInProgress(message: 'Получение вопросов'));
    try {
      final progress = _levelProgressRepository.getLevelProgress(
        levelId: levelId,
      );
      final questions = _gameModuleLevelRepository.getQuestionsForLevel(
        levelId: levelId,
        ageCategory: ageCategory,
      );
      final results = await Future.wait([questions, progress]);
      final questionsResult = results[0] as List<GameModuleQuestionEntity>;
      final progressResult = results[1] as LevelProgressEntity?;
      emit(
        ReceiveSuccess(
          questions: questionsResult,
          currentIndex: -1,
          progress: progressResult,
          isAnswered: false,
        ),
      );
    } catch (e) {
      emit(ReceiveFailed(message: 'Ошибка загрузки вопросов: $e'));
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
    emit(successState.copyWith(isAnswered: true));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answer,
        correctAnswer: currentQuestion.correctAnswer,
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
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
    emit(successState.copyWith(isAnswered: true));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answerAsString,
        correctAnswer: currentQuestion.correctAnswer,
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
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
    emit(successState.copyWith(isAnswered: true));
    emit(
      AnswerInProgress(
        isCorrect: isCorrect,
        explanation: currentQuestion.explanation,
        selectedAnswer: answer,
        correctAnswer: currentQuestion.correctAnswer,
        question: currentQuestion,
        currentIndex: successState.currentIndex,
        questions: successState.questions,
        progress: successState.progress,
      ),
    );
  }

  Future<void> _nextQuestions({
  required Emitter<GameModuleLevelState> emit,
}) async {
  int currentIndex;
  List<GameModuleQuestionEntity> questions;
  LevelProgressEntity? progress;

  if (state is ReceiveSuccess) {
    currentIndex = (state as ReceiveSuccess).currentIndex;
    questions = (state as ReceiveSuccess).questions;
    progress = (state as ReceiveSuccess).progress;
  } else if (state is AnswerInProgress) {
    currentIndex = (state as AnswerInProgress).currentIndex;
    questions = (state as AnswerInProgress).questions;
    progress = (state as AnswerInProgress).progress;
  } else {
    return;
  }

  final nextIndex = currentIndex + 1;
  if (nextIndex < questions.length) {
    emit(ReceiveSuccess(
      questions: questions,
      currentIndex: nextIndex,
      progress: progress,
      isAnswered: false,
    ));
  } else {
    emit(LevelCompleted());
  }
}

  Future<void> _retryLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    if (state is! ReceiveSuccess) return;
    final successState = state as ReceiveSuccess;
    final levelId = successState.questions.first.levelId;
    final ageCategory = successState.questions.first.ageCategory;
    _receiveGameLevel(emit: emit, levelId: levelId, ageCategory: ageCategory);
  }

  Future<void> _startLevel({
    required Emitter<GameModuleLevelState> emit,
  }) async {
    if (state is! ReceiveSuccess) return;
    final currentState = state as ReceiveSuccess;
    print('_startLevel called, changing index to 0');
    emit(
      ReceiveSuccess(
        questions: currentState.questions,
        currentIndex: 0,
        progress: currentState.progress,
        isAnswered: false,
      ),
    );
  }
}
