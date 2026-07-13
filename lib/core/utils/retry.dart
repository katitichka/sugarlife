/// Повторяет [action] до [maxAttempts] раз с задержкой между попытками.
///
/// На последней неудачной попытке ошибка пробрасывается вызывающему коду.
/// Задержка по умолчанию постоянна ([delay]), либо вычисляется через
/// [delayBuilder] (получает номер только что провалившейся попытки, начиная с 1).
Future<T> withRetry<T>(
  Future<T> Function() action, {
  int maxAttempts = 3,
  Duration delay = const Duration(seconds: 3),
  Duration Function(int attempt)? delayBuilder,
}) async {
  for (int attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      return await action();
    } catch (e) {
      if (attempt == maxAttempts) rethrow;
      await Future.delayed(delayBuilder?.call(attempt) ?? delay);
    }
  }
  throw StateError('unreachable');
}
