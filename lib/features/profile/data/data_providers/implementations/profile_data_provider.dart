import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';

abstract interface class ProfileDataProvider {
  Future<void> register({
    required String name,
    required int age,
    required String gender,
  });

  Future<bool> get isAuthenticated;

  Future<ProfileDto?> get currentUser;
}
