import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';

abstract class ProfileRepository {
  Future<String> getAvatarUrl(int avatarId);
  Future<List<CharacterEntity>> getAllCharacters();
  Future<void> updateUsername(String newUsername);
  Future<void> updateAvatar(int avatarId);
}
