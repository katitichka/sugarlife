import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'theory_module_list_entity.freezed.dart';

@freezed
sealed class TheoryModuleListEntity with _$TheoryModuleListEntity {
  const factory TheoryModuleListEntity({
    required int id,
    required String title,
    required String subtitle,
    required String characterImageUrl,
    required Color color,
  }) = _TheoryModuleListEntity;
}
