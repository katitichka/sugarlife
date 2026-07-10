import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/avatars/data/mappers/avatar_mapper.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/profile/data/providers/profile_data_provider.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataProvider _dataProvider;
  final AppCacheService _cache;

  ProfileRepositoryImpl(this._dataProvider, this._cache);

  String _publicSvgUrl(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return t;
    final lower = t.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      return t;
    }
    var path = t.startsWith('/') ? t.substring(1) : t;
    final bucketPrefix = 'avatars/';
    if (path.toLowerCase().startsWith(bucketPrefix)) {
      path = path.substring(bucketPrefix.length);
    }
    return _dataProvider.resolveAvatarUrl(path);
  }

  @override
  Future<String> getAvatarUrl(int avatarId) async {
    final avatars = _cache.avatars;
    if (avatars != null) {
      for (final c in avatars) {
        if (c.id == avatarId) {
          return _publicSvgUrl(c.imageUrl);
        }
      }
    }

    final dto = await _dataProvider.getAvatarById(avatarId);
    if (dto.imageUrl.isEmpty) {
      throw StateError('Пустой image_url для аватара id=$avatarId');
    }
    return _publicSvgUrl(dto.imageUrl);
  }

  @override
  Future<void> updateUsername(String newUsername) async {
    final userId = _dataProvider.currentUserId;
    if (userId == null) return;

    await _dataProvider.updateUsername(userId: userId, newUsername: newUsername);
  }

  @override
  Future<void> updateAvatar(int avatarId) async {
    final userId = _dataProvider.currentUserId;
    if (userId == null) return;

    await _dataProvider.updateAvatar(userId: userId, avatarId: avatarId);
  }

  @override
  Future<List<AvatarEntity>> getAllAvatars() async {
    final cachedAvatars = _cache.avatars;
    if (cachedAvatars != null) {
      return cachedAvatars;
    }

    final dtos = await _dataProvider.getAllAvatars();

    final avatars = dtos.map((dto) {
      final resolvedDto = dto.imageUrl.isNotEmpty
          ? dto.copyWith(imageUrl: _publicSvgUrl(dto.imageUrl))
          : dto;
      return AvatarDtoMapper.toEntity(dto: resolvedDto);
    }).toList();

    _cache.saveAvatars(avatars);
    return avatars;
  }
}
