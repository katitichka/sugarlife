import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/avatars/data/dtos/avatar_dto.dart';
import 'package:sugarlife/features/profile/data/providers/profile_data_provider.dart';

class ProfileDataProviderImpl implements ProfileDataProvider {
  ProfileDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  String? get currentUserId => _api.currentUserId;
  @override
  String resolveAvatarUrl(String path) => _api.assetUrl(path);

  @override
  Future<AvatarDto> getAvatarById(int avatarId) async => AvatarDto.fromJson(
    await _api.get('/avatars/$avatarId') as Map<String, dynamic>,
  );

  @override
  Future<void> updateUsername({
    required String userId,
    required String newUsername,
  }) async {
    await _api.patch('/me', {'username': newUsername});
  }

  @override
  Future<void> updateAvatar({
    required String userId,
    required int avatarId,
  }) async {
    await _api.patch('/me', {'current_avatar_id': avatarId});
  }

  @override
  Future<List<AvatarDto>> getAllAvatars() async =>
      (await _api.get('/avatars') as List)
          .map((row) => AvatarDto.fromJson(row as Map<String, dynamic>))
          .toList();
}
