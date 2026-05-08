import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_module_question_dto.freezed.dart';
part 'game_module_question_dto.g.dart';

@freezed
sealed class GameModuleQuestionDto with _$GameModuleQuestionDto {
  const factory GameModuleQuestionDto({
    required int id,
    required String question,
    @JsonKey(name: 'question_type') required String questionsType,
    required List<String> answers,
    required String explanation,
    @JsonKey(name: 'order_index') required int orderIndex,
    @JsonKey(name: 'level_id') required int levelId,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
  }) = _GameModuleQuestionDto;
  factory GameModuleQuestionDto.fromJson(Map<String, Object?> json) =>
      _$GameModuleQuestionDtoFromJson(json);
}

