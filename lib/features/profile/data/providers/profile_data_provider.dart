import 'package:sugarlife/features/avatars/data/dtos/avatar_dto.dart';

abstract class ProfileDataProvider {
  String? get currentUserId;

  String resolveAvatarUrl(String path);

  Future<AvatarDto> getAvatarById(int avatarId);

  Future<void> updateUsername({required String userId, required String newUsername});

  Future<void> updateAvatar({required String userId, required int avatarId});

  Future<List<AvatarDto>> getAllAvatars();
}
