import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/game_module/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/domain/entities/game_module_question_entity.dart';

abstract class GameModuleQuestionDtoMapper {
  static GameModuleQuestionEntity toEntity(
      {required GameModuleQuestionDto dto}) {
    return GameModuleQuestionEntity(
      id: dto.id,
      question: dto.question,
      questionType: QuestionType.fromString(dto.questionsType),
      answers: dto.answers,
      explanation: dto.explanation,
      orderIndex: dto.orderIndex,
      levelId: dto.levelId,
      ageCategory: AgeCategory.fromString(dto.ageCategory),
      correctAnswer: dto.correctAnswer,
    );
  }
}
