import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_question_dto.freezed.dart';
part 'game_module_question_dto.g.dart';

@freezed
sealed class GameModuleQuestionDto with _$GameModuleQuestionDto {
  const factory GameModuleQuestionDto({
    required int id,
    String? question,
    @JsonKey(name: 'question_type') String? questionType,
    List<Object?>? answers,
    String? explanation,
    @JsonKey(name: 'order_index') int? orderIndex,
    @JsonKey(name: 'level_id') required int levelId,
    @JsonKey(name: 'correct_answer') Object? correctAnswer,
    @JsonKey(name: 'character_id') num? characterId,
  }) = _GameModuleQuestionDto;

  factory GameModuleQuestionDto.fromJson(Map<String, Object?> json) =>
      _$GameModuleQuestionDtoFromJson(json);
}
