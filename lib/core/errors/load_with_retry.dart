import 'dart:async';

import 'package:sugarlife/core/errors/error_mapper.dart';

/// Выполняет загрузку с автоматическим повтором при сетевых сбоях.
Future<T> loadWithRetry<T>(
  Future<T> Function() action, {
  int maxAttempts = 2,
  Duration delayBetweenAttempts = const Duration(milliseconds: 800),
  Duration perAttemptTimeout = const Duration(seconds: 12),
}) async {
  Object? lastError;
  for (var attempt = 0; attempt < maxAttempts; attempt++) {
    try {
      return await action().timeout(perAttemptTimeout);
    } catch (e) {
      lastError = e;
      final isLastAttempt = attempt >= maxAttempts - 1;
      if (isLastAttempt || !ErrorMapper.isRetryable(e)) {
        rethrow;
      }
      await Future<void>.delayed(delayBetweenAttempts);
    }
  }
  throw lastError ?? Exception('loadWithRetry failed');
}
