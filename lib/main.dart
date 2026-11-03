import 'package:flutter/material.dart';
import 'package:sugarlife/app.dart';
import 'package:sugarlife/core/api/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  if (apiBaseUrl.isEmpty) {
    throw StateError(
      'Передайте адрес сервера через --dart-define=API_BASE_URL=https://...',
    );
  }
  app(await ApiClient.create(apiBaseUrl));
}
