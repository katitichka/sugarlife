import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';

void main() {
  group('GameModuleQuestionEntity.isAnswerCorrect', () {
    test('returns false instead of throwing for malformed true/false data', () {
      final question = _question(
        type: QuestionType.trueFalse,
        answers: const [],
        correctAnswer: 'Правда',
      );

      expect(question.isAnswerCorrect(true), isFalse);
    });

    test('accepts multiple-select answers in any order', () {
      final question = _question(
        type: QuestionType.multipleSelect,
        answers: const ['A', 'B', 'C'],
        correctIndices: const [0, 2],
      );

      expect(question.isAnswerCorrect(<int>[2, 0]), isTrue);
      expect(question.isAnswerCorrect(<int>[0, 1]), isFalse);
    });

    test('returns false for an answer of an unexpected runtime type', () {
      final choice = _question(
        type: QuestionType.multipleChoice,
        answers: const ['A', 'B'],
        correctAnswer: 'A',
      );
      final multiple = _question(
        type: QuestionType.multipleSelect,
        answers: const ['A', 'B'],
        correctIndices: const [0],
      );

      expect(choice.isAnswerCorrect(true), isFalse);
      expect(multiple.isAnswerCorrect('0'), isFalse);
    });

    test('rejects duplicate selections', () {
      final question = _question(
        type: QuestionType.multipleSelect,
        answers: const ['A', 'B'],
        correctIndices: const [0, 1],
      );

      expect(question.isAnswerCorrect(<int>[0, 0]), isFalse);
    });
  });
}

GameModuleQuestionEntity _question({
  required QuestionType type,
  required List<String> answers,
  String? correctAnswer,
  List<int>? correctIndices,
}) {
  return GameModuleQuestionEntity(
    id: 1,
    question: 'Вопрос',
    questionType: type,
    answers: answers,
    explanation: 'Объяснение',
    orderIndex: 1,
    levelId: 1,
    correctAnswer: correctAnswer,
    correctAnswerIndices: correctIndices,
  );
}
