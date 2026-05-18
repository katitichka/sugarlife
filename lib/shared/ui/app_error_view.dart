import 'package:flutter/material.dart';
import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:sugarlife/core/theme/app_color.dart';

/// Экран/блок ошибки с кнопкой повтора.
class AppErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool compact;
  final bool wrapInScaffold;

  const AppErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.compact = false,
    this.wrapInScaffold = true,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = compact ? 40.0 : 56.0;
    final fontSize = compact ? 14.0 : 16.0;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.cloud_off_outlined, size: iconSize, color: AppColors.grey),
        SizedBox(height: compact ? 12 : 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: compact ? Colors.black87 : AppColors.white,
            height: 1.4,
          ),
        ),
        if (onRetry != null) ...[
          SizedBox(height: compact ? 16 : 24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 20),
            label: const Text(ErrorMessages.retryButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ],
    );

    if (compact) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: content,
      );
    }

    final body = Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: content,
      ),
    );

    if (!wrapInScaffold) return body;

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: body,
    );
  }
}
