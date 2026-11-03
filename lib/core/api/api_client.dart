import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  const ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => message;
}

class ApiClient {
  ApiClient._(
    this.baseUrl,
    this._http,
    this._storage,
    this._token,
    this._userId,
  );

  static const _tokenKey = 'go_api_token';
  static const _userIdKey = 'go_api_user_id';

  final Uri baseUrl;
  final http.Client _http;
  final FlutterSecureStorage _storage;
  String? _token;
  String? _userId;

  String? get currentUserId => _userId;

  static Future<ApiClient> create(
    String url, {
    http.Client? httpClient,
    FlutterSecureStorage? storage,
  }) async {
    final baseUrl = Uri.parse(url.endsWith('/') ? url : '$url/');
    if (!baseUrl.hasScheme || baseUrl.host.isEmpty) {
      throw ArgumentError.value(url, 'url', 'Неверный адрес API');
    }
    final secureStorage = storage ?? const FlutterSecureStorage();
    final token = await secureStorage.read(key: _tokenKey);
    final userId = await secureStorage.read(key: _userIdKey);
    return ApiClient._(
      baseUrl,
      httpClient ?? http.Client(),
      secureStorage,
      token,
      userId,
    );
  }

  Uri url(String path, [Map<String, String>? query]) => baseUrl
      .resolve(path.startsWith('/') ? path.substring(1) : path)
      .replace(queryParameters: query);

  String assetUrl(String path) {
    if (Uri.tryParse(path)?.hasScheme ?? false) return path;
    final normalized = path.startsWith('/') ? path.substring(1) : path;
    return url(
      normalized.startsWith('assets/') ? normalized : 'assets/$normalized',
    ).toString();
  }

  Future<void> saveSession(String userId, String token) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _userIdKey, value: userId);
    _token = token;
    _userId = userId;
  }

  Future<void> clearSession() async {
    _token = null;
    _userId = null;
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userIdKey);
  }

  Future<dynamic> get(String path, {Map<String, String>? query}) =>
      _request('GET', path, query: query);
  Future<dynamic> post(String path, [Object? body]) =>
      _request('POST', path, body: body);
  Future<dynamic> put(String path, [Object? body]) =>
      _request('PUT', path, body: body);
  Future<dynamic> patch(String path, [Object? body]) =>
      _request('PATCH', path, body: body);

  Future<dynamic> _request(
    String method,
    String path, {
    Object? body,
    Map<String, String>? query,
  }) async {
    final request = http.Request(method, url(path, query));
    request.headers['Accept'] = 'application/json';
    if (_token != null) request.headers['Authorization'] = 'Bearer $_token';
    if (body != null) {
      request.headers['Content-Type'] = 'application/json';
      request.body = jsonEncode(body);
    }
    final response = await http.Response.fromStream(await _http.send(request));
    if (response.statusCode == 401 && _token != null) await clearSession();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      String message = 'Ошибка сервера (${response.statusCode})';
      try {
        final decoded = jsonDecode(response.body);
        if (decoded is Map && decoded['error'] is String) {
          message = decoded['error'] as String;
        }
      } catch (_) {}
      throw ApiException(response.statusCode, message);
    }
    if (response.body.isEmpty) return null;
    return jsonDecode(response.body);
  }
}
