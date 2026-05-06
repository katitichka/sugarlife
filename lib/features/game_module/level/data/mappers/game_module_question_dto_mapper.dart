import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';

abstract class GameModuleQuestionDtoMapper {
  static GameModuleQuestionEntity toEntity({
    required GameModuleQuestionDto dto,
  }) {
    final questionType = QuestionType.parseLoose(dto.questionsType);
    
    List<int>? correctAnswerIndices;
    if (questionType == QuestionType.multipleSelect && dto.correctAnswer != null) {
      correctAnswerIndices = dto.correctAnswer!
          .split(',')
          .map((e) => int.tryParse(e.trim()))
          .whereType<int>()
          .toList();
    }
    
    return GameModuleQuestionEntity(
      id: dto.id,
      question: dto.question,
      questionType: questionType,
      answers: dto.answers,
      explanation: dto.explanation,
      orderIndex: dto.orderIndex,
      levelId: dto.levelId,
      correctAnswer: dto.correctAnswer,
      correctAnswerIndices: correctAnswerIndices,
    );
  }
}