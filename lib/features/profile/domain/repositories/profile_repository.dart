
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getUser();

  Future<void> saveUser(ProfileEntity user);

  Future<bool> hasUser();
}