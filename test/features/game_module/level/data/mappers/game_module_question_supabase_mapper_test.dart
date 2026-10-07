import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/level/data/mappers/game_module_question_supabase_mapper.dart';

void main() {
  group('GameModuleQuestionSupabaseMapper', () {
    test('maps boolean true/false answers to their displayed labels', () {
      final trueQuestion = GameModuleQuestionSupabaseMapper.toEntity(
        _dto(type: 'true_false', correctAnswer: true),
      );
      final falseQuestion = GameModuleQuestionSupabaseMapper.toEntity(
        _dto(type: 'true_false', correctAnswer: 'false'),
      );

      expect(trueQuestion.correctAnswer, 'Правда');
      expect(trueQuestion.isAnswerCorrect(true), isTrue);
      expect(falseQuestion.correctAnswer, 'Ложь');
      expect(falseQuestion.isAnswerCorrect(false), isTrue);
    });

    test('accepts numeric strings and removes duplicate select indices', () {
      final question = GameModuleQuestionSupabaseMapper.toEntity(
        _dto(type: 'multiple_select', correctAnswer: <Object?>['2', 0, '2']),
      );

      expect(question.correctAnswerIndices, [0, 2]);
      expect(question.correctAnswer, '0,2');
      expect(question.isAnswerCorrect(<int>[2, 0]), isTrue);
    });
  });
}

GameModuleQuestionDto _dto({
  required String type,
  required Object? correctAnswer,
}) {
  return GameModuleQuestionDto(
    id: 1,
    question: 'Вопрос',
    questionType: type,
    answers: const ['Правда', 'Ложь', 'Другой вариант'],
    explanation: 'Объяснение',
    orderIndex: 1,
    levelId: 1,
    correctAnswer: correctAnswer,
  );
}
