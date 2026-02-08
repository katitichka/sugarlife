// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_module_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameModuleQuestionDto _$GameModuleQuestionDtoFromJson(
        Map<String, dynamic> json) =>
    _GameModuleQuestionDto(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      questionsType: json['question_type'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      explanation: json['explanation'] as String,
      orderIndex: (json['order_index'] as num).toInt(),
      levelId: (json['level_id'] as num).toInt(),
      ageCategory: json['age_category'] as String,
      correctAnswer: json['correct_answer'] as String,
    );

Map<String, dynamic> _$GameModuleQuestionDtoToJson(
        _GameModuleQuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'question_type': instance.questionsType,
      'answers': instance.answers,
      'explanation': instance.explanation,
      'order_index': instance.orderIndex,
      'level_id': instance.levelId,
      'age_category': instance.ageCategory,
      'correct_answer': instance.correctAnswer,
    };
