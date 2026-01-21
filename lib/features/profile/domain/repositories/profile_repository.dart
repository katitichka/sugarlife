
import 'package:sugarlife/features/profile/domain/entities/profile_docs_response_entity';

abstract class ProfileRepository {
  Future<ProfileDocsResponseEntity> getUser();

  Future<void> saveUser(ProfileDocsResponseEntity user);

  Future<bool> hasUser();
}