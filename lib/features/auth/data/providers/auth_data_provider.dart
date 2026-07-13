import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';

abstract class AuthDataProvider {
  String? get currentUserId;

  Future<String?> signInWithPassword({
    required String email,
    required String password,
  });

  Future<String?> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  });

  Future<void> signOut();

  Future<ProfileDto?> getUserProfile(String userId);

  Future<void> insertUserProfile({
    required String userId,
    required String username,
    required int currentAvatarId,
  });
}
