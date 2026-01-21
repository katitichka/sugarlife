import 'package:sugarlife/core/theme/app_database.dart';
import 'package:sugarlife/features/profile/data/DTOs/profile_docs_response_dto.dart';
import 'package:sugarlife/features/profile/data/data_providers/implementations/profile_data_provider.dart';

class ProfileDataProviderImpl implements ProfileDataProvider {
  Future<void> register({
    required String name,
    required int age,
    required String gender,
  }) async {
    final db = await AppDatabase.database;

    await db.insert(
      'user',
      {
        'id': 1,
        'name': name,
        'age': age,
        'gender': gender,
      },
    );
  }

  @override
  Future<bool> get isAuthenticated async {
    final db = await AppDatabase.database;
    final result = await db.query('user');
    return result.isNotEmpty;
  }

  @override
  Future<ProfileDocsResponseDto?> get currentUser async {
    final db = await AppDatabase.database;
    final result = await db.query('user', limit: 1);
    if (result.isEmpty) return null;
    return ProfileDocsResponseDto.fromJson(result.first);
  }
}
