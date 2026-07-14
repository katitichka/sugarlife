import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sugarlife/features/theory_module/data/dtos/theory_module_dto.dart';
import 'package:sugarlife/features/theory_module/data/providers/theory_module_data_provider.dart';

class TheoryModuleDataProviderImpl implements TheoryModuleDataProvider {
  static const String _assetPath = 'assets/modules/theory/theory_modules.json';

  @override
  Future<List<TheoryModuleDto>> getModules() async {
    final raw = await rootBundle.loadString(_assetPath);
    final decoded = jsonDecode(raw) as List<dynamic>;

    final modules = decoded
        .map((json) => TheoryModuleDto.fromJson(json as Map<String, dynamic>))
        .toList();
    modules.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return modules;
  }
}
