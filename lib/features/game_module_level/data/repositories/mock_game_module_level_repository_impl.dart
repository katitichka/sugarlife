import 'package:sugarlife/core/enum/age_category.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/game_module_level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module_level/domain/repositories/game_module_level_repository.dart';

class MockGameModuleLevelRepositoryImpl implements GameModuleLevelRepository {
  // Единый источник данных - например, список всех вопросов
  final List<GameModuleQuestionEntity> _allLevels = [
  // ===== УРОВЕНЬ 1 =====
  
  // Вопрос 1
  GameModuleQuestionEntity(
    id: 1,
    question: 'Какой ответ правильный?',
    questionType: QuestionType.multipleChoice,
    answers: ['Неправильный 1', 'Правильный', 'Неправильный 2','Неправильный 3'],
    explanation: 'Потому что это тестовый вопрос',
    orderIndex: 1,
    levelId: 1,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Правильный',
  ),
  
  // Вопрос 2
  GameModuleQuestionEntity(
    id: 2,
    question: 'Выберите верный вариант',
    questionType: QuestionType.multipleChoice,
    answers: ['Неправильный А', 'Неправильный Б', 'Правильный', 'Неправильный B'],
    explanation: 'Объяснение правильного ответа',
    orderIndex: 2,
    levelId: 1,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Правильный',
  ),
  
  // Вопрос 3
  GameModuleQuestionEntity(
    id: 3,
    question: 'Это правда или ложь?',
    questionType: QuestionType.trueFalse,
    answers: ['Правда', 'Ложь'],
    explanation: 'На самом деле это правда',
    orderIndex: 3,
    levelId: 1,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Правда',
  ),
  
  // Вопрос 4
  GameModuleQuestionEntity(
    id: 4,
    question: 'Заполните пропуск: Тестовый _______',
    questionType: QuestionType.fillBlank,
    answers: ['вопрос', 'ответ', 'пример'],
    explanation: 'Правильное слово - "вопрос"',
    orderIndex: 4,
    levelId: 1,
    ageCategory: AgeCategory.child,
    correctAnswer: 'вопрос',
  ),
  
  // ===== УРОВЕНЬ 2 =====
  
  // Вопрос 5
  GameModuleQuestionEntity(
    id: 5,
    question: 'Какой вариант верный?',
    questionType: QuestionType.multipleChoice,
    answers: ['Неправильный X', 'Правильный', 'Неправильный Y', 'Неправильный H'],
    explanation: 'Пояснение для второго уровня',
    orderIndex: 1,
    levelId: 2,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Правильный',
  ),
  
  // Вопрос 6
  GameModuleQuestionEntity(
    id: 6,
    question: 'Выберите правильный ответ',
    questionType: QuestionType.multipleChoice,
    answers: ['Ошибка 1', 'Ошибка 2', 'Верный'],
    explanation: 'Это правильный выбор',
    orderIndex: 2,
    levelId: 2,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Верный',
  ),
  
  // Вопрос 7
  GameModuleQuestionEntity(
    id: 7,
    question: 'Правда или ложь?',
    questionType: QuestionType.trueFalse,
    answers: ['Правда', 'Ложь'],
    explanation: 'Это ложь',
    orderIndex: 3,
    levelId: 2,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Ложь',
  ),
  
  // Вопрос 8
  GameModuleQuestionEntity(
    id: 8,
    question: 'Вставьте слово: Тестирование ______',
    questionType: QuestionType.fillBlank,
    answers: ['кода', 'приложения', 'работает'],
    explanation: 'Правильно: "работает"',
    orderIndex: 4,
    levelId: 2,
    ageCategory: AgeCategory.child,
    correctAnswer: 'работает',
  ),
];

  
  @override
  Future<List<GameModuleQuestionEntity>> getQuestionsForLevel({
    required int levelId,
    required AgeCategory ageCategory,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Фильтруем вопросы по levelId
    return _allLevels
        .where((Level) => Level.levelId == levelId)
        .toList();
  }
  
}