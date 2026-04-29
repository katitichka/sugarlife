import 'package:freezed_annotation/freezed_annotation.dart';
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
    final String? correctAnswer, // для multiple_choice, true_false, fill_blank
    final List<int>? correctAnswerIndices, // для multiple_select
  }) = _GameModuleQuestionEntity;

  bool isAnswerCorrect(dynamic userAnswer) {
    switch (questionType) {
      case QuestionType.multipleChoice:
        final userSelectedAnswer = userAnswer as String;
        return userSelectedAnswer == correctAnswer;
      case QuestionType.trueFalse:
        final userBool = userAnswer as bool;
        final userAnswerText = userBool
            ? answers[0]
            : answers[1]; // answers[0] - "Правда", answers[1] - "Ложь"
        return userAnswerText == correctAnswer;
      case QuestionType.fillBlank:
        final userText = userAnswer as String;
        return userText.trim().toLowerCase() ==
            correctAnswer?.trim().toLowerCase();
      case QuestionType.multipleSelect:
        final userIndices = userAnswer as List<int>;
        if (correctAnswer == null) return false;

        // Парсим строку '0, 2, 4, 5, 6' в List<int>
        final correctIndices = correctAnswer!
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .whereType<int>()
            .toList();

        if (userIndices.length != correctIndices.length) return false;
        return userIndices.toSet().containsAll(correctIndices);
    }
  }
}
