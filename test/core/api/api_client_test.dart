import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:sugarlife/core/api/api_client.dart';
import 'package:sugarlife/features/auth/data/providers/implementations/auth_data_provider_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test(
    'login stores a session and sends its token on profile requests',
    () async {
      final requests = <http.Request>[];
      final api = await ApiClient.create(
        'https://example.test/api/',
        httpClient: MockClient((request) async {
          requests.add(request);
          if (request.url.path == '/api/auth/login') {
            return http.Response(
              jsonEncode({'user_id': 'user-1', 'token': 'secret'}),
              200,
            );
          }
          return http.Response(
            jsonEncode({
              'id': 'user-1',
              'username': 'Tester',
              'current_avatar_id': 1,
              'level': 0,
            }),
            200,
          );
        }),
      );
      final auth = AuthDataProviderImpl(api);

      expect(
        await auth.signInWithPassword(
          email: 'a@example.test',
          password: 'password',
        ),
        'user-1',
      );
      expect((await auth.getUserProfile('user-1'))?.username, 'Tester');
      expect(requests[0].body, contains('a@example.test'));
      expect(requests[1].headers['Authorization'], 'Bearer secret');
      expect(api.currentUserId, 'user-1');
    },
  );

  test('expired session is removed after 401', () async {
    FlutterSecureStorage.setMockInitialValues({
      'go_api_token': 'old',
      'go_api_user_id': 'user-1',
    });
    final api = await ApiClient.create(
      'https://example.test/',
      httpClient: MockClient(
        (request) async => http.Response('{"error":"invalid session"}', 401),
      ),
    );

    await expectLater(api.get('/me'), throwsA(isA<ApiException>()));
    expect(api.currentUserId, isNull);
    final restarted = await ApiClient.create('https://example.test/');
    expect(restarted.currentUserId, isNull);
  });

  test('asset paths from imported content resolve once', () async {
    final api = await ApiClient.create('https://example.test/api/');
    expect(
      api.assetUrl('/assets/avatars/orangeava.svg'),
      'https://example.test/api/assets/avatars/orangeava.svg',
    );
    expect(
      api.assetUrl('assets/avatars/orangeava.svg'),
      'https://example.test/api/assets/avatars/orangeava.svg',
    );
  });
}
