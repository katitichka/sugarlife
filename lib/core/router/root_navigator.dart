import 'package:flutter/material.dart';

/// Ключ корневого навигатора [MaterialApp.router] / [GoRouter] для показа
/// диалогов поверх вложенных маршрутов 
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
