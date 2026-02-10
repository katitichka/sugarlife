import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/features/game_module/domain/entities/game_module_question_entity.dart';

abstract interface class GameModuleQuestionRepository{
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel(int levelId, AgeCategory ageCategory);
}