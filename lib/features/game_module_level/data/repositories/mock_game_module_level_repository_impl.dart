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

// ===== УРОВЕНЬ 3 =====
  
  // Вопрос 9
  GameModuleQuestionEntity(
    id: 9,
    question: 'Какой вариант верный?',
    questionType: QuestionType.multipleChoice,
    answers: ['Неправильный X', 'Правильный', 'Неправильный Y', 'Неправильный H'],
    explanation: 'Пояснение для второго уровня',
    orderIndex: 1,
    levelId: 3,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Правильный',
  ),
  
  // Вопрос 10
  GameModuleQuestionEntity(
    id: 10,
    question: 'Выберите правильный ответ',
    questionType: QuestionType.multipleChoice,
    answers: ['Ошибка 1', 'Ошибка 2', 'Верный'],
    explanation: 'Это правильный выбор',
    orderIndex: 2,
    levelId: 3,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Верный',
  ),
  
  // Вопрос 11
  GameModuleQuestionEntity(
    id: 11,
    question: 'Правда или ложь?',
    questionType: QuestionType.trueFalse,
    answers: ['Правда', 'Ложь'],
    explanation: 'Это ложь',
    orderIndex: 3,
    levelId: 3,
    ageCategory: AgeCategory.child,
    correctAnswer: 'Ложь',
  ),
  
  // Вопрос 12
  GameModuleQuestionEntity(
    id: 12,
    question: 'Вставьте слово: Тестирование ______',
    questionType: QuestionType.fillBlank,
    answers: ['кода', 'приложения', 'работает'],
    explanation: 'Правильно: "работает"',
    orderIndex: 4,
    levelId: 3,
    ageCategory: AgeCategory.child,
    correctAnswer: 'работает',
  ),
  // ===== УРОВЕНЬ 4 =====

// Вопрос 13
GameModuleQuestionEntity(
  id: 13,
  question: 'Какой вариант верный? (уровень 4)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный 1', 'Правильный', 'Неправильный 2', 'Неправильный 3'],
  explanation: 'Пояснение для четвёртого уровня',
  orderIndex: 1,
  levelId: 4,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 14
GameModuleQuestionEntity(
  id: 14,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка 1', 'Ошибка 2', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 4,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 15
GameModuleQuestionEntity(
  id: 15,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это правда',
  orderIndex: 3,
  levelId: 4,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правда',
),

// Вопрос 16
GameModuleQuestionEntity(
  id: 16,
  question: 'Вставьте слово: Уровень ______',
  questionType: QuestionType.fillBlank,
  answers: ['четыре', '4', 'пройден'],
  explanation: 'Правильно: "четыре"',
  orderIndex: 4,
  levelId: 4,
  ageCategory: AgeCategory.child,
  correctAnswer: 'четыре',
),
// ===== УРОВЕНЬ 5 =====

// Вопрос 17
GameModuleQuestionEntity(
  id: 17,
  question: 'Какой вариант верный? (уровень 5)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный A', 'Правильный', 'Неправильный B', 'Неправильный C'],
  explanation: 'Пояснение для пятого уровня',
  orderIndex: 1,
  levelId: 5,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 18
GameModuleQuestionEntity(
  id: 18,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка X', 'Ошибка Y', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 5,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 19
GameModuleQuestionEntity(
  id: 19,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это ложь',
  orderIndex: 3,
  levelId: 5,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Ложь',
),

// Вопрос 20
GameModuleQuestionEntity(
  id: 20,
  question: 'Вставьте слово: Пятый ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 5,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
),
// Вопрос 21
GameModuleQuestionEntity(
  id: 21,
  question: 'Какой вариант верный? (уровень 6)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный A', 'Правильный', 'Неправильный B', 'Неправильный C'],
  explanation: 'Пояснение для шестого уровня',
  orderIndex: 1,
  levelId: 6,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 22
GameModuleQuestionEntity(
  id: 22,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка X', 'Ошибка Y', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 6,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 23
GameModuleQuestionEntity(
  id: 23,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это правда',
  orderIndex: 3,
  levelId: 6,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правда',
),

// Вопрос 24
GameModuleQuestionEntity(
  id: 24,
  question: 'Вставьте слово: Шестой ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 6,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
),
// Вопрос 25
GameModuleQuestionEntity(
  id: 25,
  question: 'Какой вариант верный? (уровень 7)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный 1', 'Правильный', 'Неправильный 2', 'Неправильный 3'],
  explanation: 'Пояснение для седьмого уровня',
  orderIndex: 1,
  levelId: 7,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 26
GameModuleQuestionEntity(
  id: 26,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка A', 'Ошибка B', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 7,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 27
GameModuleQuestionEntity(
  id: 27,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это ложь',
  orderIndex: 3,
  levelId: 7,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Ложь',
),

// Вопрос 28
GameModuleQuestionEntity(
  id: 28,
  question: 'Вставьте слово: Седьмой ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 7,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
),
// Вопрос 29
GameModuleQuestionEntity(
  id: 29,
  question: 'Какой вариант верный? (уровень 8)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный X', 'Правильный', 'Неправильный Y', 'Неправильный Z'],
  explanation: 'Пояснение для восьмого уровня',
  orderIndex: 1,
  levelId: 8,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 30
GameModuleQuestionEntity(
  id: 30,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка 1', 'Ошибка 2', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 8,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 31
GameModuleQuestionEntity(
  id: 31,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это правда',
  orderIndex: 3,
  levelId: 8,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правда',
),

// Вопрос 32
GameModuleQuestionEntity(
  id: 32,
  question: 'Вставьте слово: Восьмой ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 8,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
),

// Вопрос 33
GameModuleQuestionEntity(
  id: 33,
  question: 'Какой вариант верный? (уровень 9)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный A', 'Правильный', 'Неправильный B', 'Неправильный C'],
  explanation: 'Пояснение для девятого уровня',
  orderIndex: 1,
  levelId: 9,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 34
GameModuleQuestionEntity(
  id: 34,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка X', 'Ошибка Y', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 9,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 35
GameModuleQuestionEntity(
  id: 35,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это ложь',
  orderIndex: 3,
  levelId: 9,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Ложь',
),

// Вопрос 36
GameModuleQuestionEntity(
  id: 36,
  question: 'Вставьте слово: Девятый ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 9,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
),
// Вопрос 37
GameModuleQuestionEntity(
  id: 37,
  question: 'Какой вариант верный? (уровень 10)',
  questionType: QuestionType.multipleChoice,
  answers: ['Неправильный 1', 'Правильный', 'Неправильный 2', 'Неправильный 3'],
  explanation: 'Пояснение для десятого уровня',
  orderIndex: 1,
  levelId: 10,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правильный',
),

// Вопрос 38
GameModuleQuestionEntity(
  id: 38,
  question: 'Выберите правильный ответ',
  questionType: QuestionType.multipleChoice,
  answers: ['Ошибка A', 'Ошибка B', 'Верный'],
  explanation: 'Это правильный выбор',
  orderIndex: 2,
  levelId: 10,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Верный',
),

// Вопрос 39
GameModuleQuestionEntity(
  id: 39,
  question: 'Правда или ложь?',
  questionType: QuestionType.trueFalse,
  answers: ['Правда', 'Ложь'],
  explanation: 'Это правда',
  orderIndex: 3,
  levelId: 10,
  ageCategory: AgeCategory.child,
  correctAnswer: 'Правда',
),

// Вопрос 40
GameModuleQuestionEntity(
  id: 40,
  question: 'Вставьте слово: Десятый ______',
  questionType: QuestionType.fillBlank,
  answers: ['уровень', 'этап', 'пройден'],
  explanation: 'Правильно: "уровень"',
  orderIndex: 4,
  levelId: 10,
  ageCategory: AgeCategory.child,
  correctAnswer: 'уровень',
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