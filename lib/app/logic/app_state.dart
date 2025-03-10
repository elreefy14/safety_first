import 'package:flutter/material.dart';

abstract class AppState {}

final class AppInitialState extends AppState {}

class ThemeChangedState extends AppState {
  final ThemeMode themeMode;

  ThemeChangedState({required this.themeMode});
}
