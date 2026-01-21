import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_docs_response_dto.freezed.dart';
part 'profile_docs_response_dto.g.dart';

@freezed
sealed class ProfileDocsResponseDto with _$ProfileDocsResponseDto {
  const factory ProfileDocsResponseDto({
    required String id,
    required String name,
    required int age,
    required String gender,
  }) = _ProfileDocsResponseDto;

  factory ProfileDocsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDocsResponseDtoFromJson(json);

}
