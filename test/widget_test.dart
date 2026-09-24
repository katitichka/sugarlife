import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';

void main() {
  testWidgets('error view shows message and invokes retry', (tester) async {
    var retryCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppErrorView(
            message: 'Не удалось загрузить данны',
            onRetry: () => retryCount++,
          ),
        ),
      ),
    );

    expect(find.text('Не удалось загрузить данны'), findsOneWidget);
    expect(find.text('Повторить'), findsOneWidget);

    await tester.tap(find.text('Повторить'));
    expect(retryCount, 1);
  });
}
