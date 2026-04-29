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

  @override
  Future<String> getAvatarUrl(int avatarId) async {
    final cachedAvatar = _cache.characters?.cast<CharacterEntity?>().firstWhere(
      (character) => character?.id == avatarId,
      orElse: () => null,
    );
    if (cachedAvatar != null) {
      return cachedAvatar.imageUrl;
    }

    final response = await _supabase
        .from('characters')
        .select('image_url')
        .eq('id', avatarId)
        .single();
    return response['image_url'];
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
    final dtos = response.map((row) => CharacterDto.fromJson(row)).toList();
    final characters = dtos
        .map((dto) => CharacterDtoMapper.toEntity(dto: dto))
        .toList();
    _cache.saveCharacters(characters);
    return characters;
  }
}
