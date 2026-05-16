import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';

abstract class ProfileRepository {
  Future<String> getAvatarUrl(int avatarId);
  Future<List<AvatarEntity>> getAllAvatars();
  Future<void> updateUsername(String newUsername);
  Future<void> updateAvatar(int avatarId);
}
