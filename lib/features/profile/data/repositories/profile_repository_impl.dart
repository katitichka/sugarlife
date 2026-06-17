import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/avatars/data/dtos/avatar_dto.dart';
import 'package:sugarlife/features/avatars/data/mappers/avatar_mapper.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final SupabaseClient _supabase;
  final AppCacheService _cache;

  ProfileRepositoryImpl(this._supabase, this._cache);

  static const String _avatarsSvgBucket = 'avatars';

  String _publicSvgUrl(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return t;
    final lower = t.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      return t;
    }
    var path = t.startsWith('/') ? t.substring(1) : t;
    final bucketPrefix = '$_avatarsSvgBucket/';
    if (path.toLowerCase().startsWith(bucketPrefix)) {
      path = path.substring(bucketPrefix.length);
    }
    return _supabase.storage.from(_avatarsSvgBucket).getPublicUrl(path);
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

    final response = await _supabase
        .from('avatars')
        .select('image_url')
        .eq('id', avatarId)
        .single();
    final url = response['image_url'];
    if (url is! String || url.isEmpty) {
      throw StateError('Пустой image_url для аватара id=$avatarId');
    }
    return _publicSvgUrl(url);
  }

  @override
  Future<void> updateUsername(String newUsername) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase
        .from('user_profile')
        .update({'username': newUsername})
        .eq('id', userId);
  }

  @override
  Future<void> updateAvatar(int avatarId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    await _supabase
        .from('user_profile')
        .update({'current_avatar_id': avatarId})
        .eq('id', userId);
  }

  @override
Future<List<AvatarEntity>> getAllAvatars() async {
  // Проверяем кэш
  final cachedAvatars = _cache.avatars;
  if (cachedAvatars != null) {
    return cachedAvatars;
  }

  final response = await _supabase
      .from('avatars')
      .select('id, image_url')
      .order('id');

  final avatars = response.map((row) {
    final map = Map<String, dynamic>.from(row);
    final raw = map['image_url'];
    if (raw is String && raw.isNotEmpty) {
      map['image_url'] = _publicSvgUrl(raw);
    }
    final dto = AvatarDto.fromJson(map);
    return AvatarDtoMapper.toEntity(dto: dto);
  }).toList();

  // Сохраняем в кэш
  _cache.saveAvatars(avatars);
  return avatars;
}
}
