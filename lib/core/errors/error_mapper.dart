import 'dart:async';
import 'dart:io';

import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Преобразует исключения в понятные пользователю сообщения.
abstract final class ErrorMapper {
  static String toUserMessage(
    Object error, {
    String? loadContext,
    String? saveContext,
    String? authContext,
  }) {
    if (error is AuthException) {
      return _mapAuthException(error, authContext: authContext);
    }
    if (error is PostgrestException) {
      return _mapPostgrestException(error);
    }
    if (error is SocketException) {
      return ErrorMessages.network;
    }
    if (error is TimeoutException) {
      return ErrorMessages.timeout;
    }
    if (error is IOException) {
      return ErrorMessages.network;
    }

    final message = _extractMessage(error);
    if (message != null) {
      final mapped = _mapKnownMessage(message);
      if (mapped != null) return mapped;
    }

    if (loadContext != null) return loadContext;
    if (saveContext != null) return saveContext;
    if (authContext != null) return authContext;

    return ErrorMessages.unknown;
  }

  /// Ошибки сети/таймаута/5xx — можно повторить запрос.
  static bool isRetryable(Object error) {
    if (error is SocketException || error is TimeoutException) {
      return true;
    }
    if (error is IOException) return true;
    if (error is PostgrestException) {
      final code = error.code;
      if (code == null) return true;
      return code.startsWith('5') || code == 'PGRST301';
    }
    if (error is AuthException) {
      final status = _parseStatusCode(error.statusCode);
      return status == null || status >= 500;
    }
    final message = _extractMessage(error)?.toLowerCase() ?? '';
    return message.contains('network') ||
        message.contains('connection') ||
        message.contains('timeout') ||
        message.contains('socket');
  }

  static String _mapAuthException(
    AuthException error, {
    String? authContext,
  }) {
    final code = error.code?.toLowerCase() ?? '';
    final message = error.message.toLowerCase();

    if (code.contains('invalid_credentials') ||
        message.contains('invalid login credentials') ||
        message.contains('invalid credentials')) {
      return ErrorMessages.invalidCredentials;
    }
    if (code.contains('user_already_registered') ||
        message.contains('already registered')) {
      return ErrorMessages.emailAlreadyRegistered;
    }
    if (code.contains('email_not_confirmed') ||
        message.contains('email not confirmed')) {
      return ErrorMessages.emailNotConfirmed;
    }
    if (code.contains('weak_password') || message.contains('weak password')) {
      return ErrorMessages.weakPassword;
    }

    final status = _parseStatusCode(error.statusCode);
    if (status != null && status >= 500) {
      return ErrorMessages.server;
    }

    return authContext ?? ErrorMessages.authFailed;
  }

  static int? _parseStatusCode(Object? statusCode) {
    if (statusCode == null) return null;
    if (statusCode is int) return statusCode;
    return int.tryParse(statusCode.toString());
  }

  static String _mapPostgrestException(PostgrestException error) {
    final code = error.code;
    if (code == 'PGRST116') return ErrorMessages.notFound;
    if (code == '42501' || code == 'PGRST301') {
      return ErrorMessages.accessDenied;
    }
    if (code != null && code.startsWith('5')) {
      return ErrorMessages.server;
    }
    return ErrorMessages.server;
  }

  static String? _mapKnownMessage(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('не удалось войти') ||
        lower.contains('invalid login') ||
        lower.contains('invalid credentials')) {
      return ErrorMessages.invalidCredentials;
    }
    if (lower.contains('профиль пользователя не найден')) {
      return ErrorMessages.notFound;
    }
    if (lower.contains('не удалось создать пользователя')) {
      return ErrorMessages.signUpFailed;
    }
    if (lower.contains('аккаунт с таким email')) {
      return ErrorMessages.emailAlreadyRegistered;
    }
    if (lower.contains('пароль должен быть')) {
      return message;
    }
    return null;
  }

  static String? _extractMessage(Object error) {
    if (error is Exception) {
      final text = error.toString();
      if (text.startsWith('Exception: ')) {
        return text.substring('Exception: '.length);
      }
      return text;
    }
    return error.toString();
  }
}
