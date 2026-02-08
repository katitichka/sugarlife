import 'package:sugarlife/features/profile/data/dtos/profile_docs_response_dto.dart';

abstract interface class ProfileDataProvider {
  Future<void> register({
    required String name,
    required int age,
    required String gender,
  });

  Future<bool> get isAuthenticated;

  Future<ProfileDocsResponseDto?> get currentUser;
}
