import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/features/characters/data/dtos/character_dto.dart';
import 'package:sugarlife/features/characters/data/mappers/character_dto_mapper.dart';
import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final SupabaseClient _supabase;
  final AppCacheService _cache;

  ProfileRepositoryImpl(this._supabase, this._cache);

  /// Bucket в Supabase Storage, где лежат SVG (`characters.image_url` — путь от корня bucket).
  /// При другом имени bucket в проекте Supabase замените значение.
  static const String _characterSvgBucket = 'avatars';

  /// В БД часто хранится только путь в Storage; для сети нужен полный public URL.
  String _publicSvgUrl(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return t;
    final lower = t.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      return t;
    }
    var path = t.startsWith('/') ? t.substring(1) : t;
    // Если в пути уже указан bucket как префикс — убираем, иначе getPublicUrl дублирует папку.
    final bucketPrefix = '$_characterSvgBucket/';
    if (path.toLowerCase().startsWith(bucketPrefix)) {
      path = path.substring(bucketPrefix.length);
    }
    return _supabase.storage.from(_characterSvgBucket).getPublicUrl(path);
  }

  @override
  Future<String> getAvatarUrl(int avatarId) async {
    final characters = _cache.characters;
    if (characters != null) {
      for (final c in characters) {
        if (c.id == avatarId) {
          return _publicSvgUrl(c.imageUrl);
        }
      }
    }

    final response = await _supabase
        .from('characters')
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
  Future<List<CharacterEntity>> getAllCharacters() async {
    final cachedCharacters = _cache.characters;
    if (cachedCharacters != null) {
      return cachedCharacters;
    }

    final response = await _supabase
        .from('characters')
        .select('id, name, image_url');
    final characters = response.map((row) {
      final map = Map<String, dynamic>.from(row);
      final raw = map['image_url'];
      if (raw is String && raw.isNotEmpty) {
        map['image_url'] = _publicSvgUrl(raw);
      }
      final dto = CharacterDto.fromJson(map);
      return CharacterDtoMapper.toEntity(dto: dto);
    }).toList();
    _cache.saveCharacters(characters);
    return characters;
  }
}
