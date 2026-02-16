import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/game_module_level/domain/entities/game_module_question_entity.dart';

abstract interface class GameModuleLevelRepository {
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
    required AgeCategory ageCategory,
  });
}
