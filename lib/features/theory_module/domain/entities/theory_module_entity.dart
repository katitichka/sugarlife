import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'theory_module_entity.freezed.dart';

@freezed
sealed class TheoryModuleEntity with _$TheoryModuleEntity {
  const factory TheoryModuleEntity({
    required int id,
    required String title,
    required String subtitle,
    required String characterImageUrl,
    required Color color,
  }) = _TheoryModuleEntity;
}
