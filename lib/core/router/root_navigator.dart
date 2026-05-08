import 'package:flutter/material.dart';

/// Ключ корневого навигатора [MaterialApp.router] / [GoRouter] для показа
/// диалогов поверх вложенных маршрутов (StatefulShellRoute и т.п.).
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
