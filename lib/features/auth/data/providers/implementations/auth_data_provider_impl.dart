import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/auth/data/providers/auth_data_provider.dart';
import 'package:sugarlife/features/profile/data/DTOs/profile_dto.dart';

class AuthDataProviderImpl implements AuthDataProvider {
  AuthDataProviderImpl(this._api);
  final ApiClient _api;

  @override
  String? get currentUserId => _api.currentUserId;

  @override
  Future<String?> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final result =
        await _api.post('/auth/login', {'email': email, 'password': password})
            as Map<String, dynamic>;
    final userId = result['user_id'] as String;
    await _api.saveSession(userId, result['token'] as String);
    return userId;
  }

  @override
  Future<String?> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    final result =
        await _api.post('/auth/register', {
              'email': email,
              'password': password,
              'username': data['username'],
            })
            as Map<String, dynamic>;
    final userId = result['user_id'] as String;
    await _api.saveSession(userId, result['token'] as String);
    return userId;
  }

  @override
  Future<void> signOut() async {
    try {
      if (_api.currentUserId != null) await _api.post('/auth/logout');
    } catch (_) {
      // Local logout must succeed even when the server is unavailable.
    } finally {
      await _api.clearSession();
    }
  }

  @override
  Future<ProfileDto?> getUserProfile(String userId) async {
    if (_api.currentUserId != userId) return null;
    try {
      return ProfileDto.fromJson(await _api.get('/me') as Map<String, dynamic>);
    } on ApiException catch (error) {
      if (error.statusCode == 404 || error.statusCode == 401) return null;
      rethrow;
    }
  }
}
