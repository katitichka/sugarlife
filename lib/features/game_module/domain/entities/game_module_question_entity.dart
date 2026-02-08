import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/core/enum/question_type.dart';

part 'game_module_question_entity.freezed.dart';

@freezed
sealed class GameModuleQuestionEntity with _$GameModuleQuestionEntity {
  const GameModuleQuestionEntity._();
  const factory GameModuleQuestionEntity({
    required int id,
    required String question,
    required QuestionType questionType,
    required List<String> answers,
    required String explanation,
    required int orderIndex,
    required int levelId,
    required AgeCategory ageCategory,
    required String correctAnswer,
  }) = _GameModuleQuestionEntity;

  bool isAnswerCorrect(dynamic userAnswer) {
    switch (questionType) {
      case QuestionType.multipleChoice:
        final userSelectedAnswer = userAnswer as String;
        return userSelectedAnswer == correctAnswer;
      case QuestionType.trueFalse:
        final userBool = userAnswer as bool;
        final correctBool = correctAnswer == 'true';
        return userBool == correctBool;
      case QuestionType.fillBlank:
        final userText = userAnswer as String;
        return userText.trim().toLowerCase() == correctAnswer.trim().toLowerCase();
    }
  }
}
