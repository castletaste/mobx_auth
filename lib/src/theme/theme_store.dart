import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:bitsgap/gen/fonts.gen.dart';
import 'package:bitsgap/src/services/storage.dart';

part 'theme_store.g.dart';

const szbx12 = SizedBox(height: 12);

// ignore: library_private_types_in_public_api
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final ThemeData _lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: const TextButtonThemeData(
        // style:
        ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(74, 85, 167, 1),
      onPrimary: Color.fromRGBO(26, 92, 255, 1),
      secondary: Color.fromRGBO(191, 219, 254, 1),
      tertiary: Color.fromRGBO(38, 41, 49, 1),
      background: Color.fromRGBO(249, 249, 249, 1),
      onError: Color.fromRGBO(0, 179, 126, 1),
      error: Color.fromRGBO(225, 46, 13, 1),
    ),
    inputDecorationTheme: InputDecorationTheme(
      
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          width: 1,
          strokeAlign: 1,
          color: Color.fromRGBO(74, 85, 167, 1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          width: 1,
          strokeAlign: 1,
          color: Color.fromRGBO(74, 85, 167, 1),
        ),
      ),
      hintStyle: const TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 16,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(38, 41, 49, 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 16,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 14,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(99, 113, 222, 1),
      onPrimary: Color.fromRGBO(26, 92, 255, 1),
      secondary: Color.fromRGBO(30, 41, 59, 1),
      tertiary: Color.fromRGBO(255, 255, 255, 1),
      background: Color.fromRGBO(24, 24, 24, 1),
      onError: Color.fromRGBO(0, 179, 126, 1),
      error: Color.fromRGBO(225, 46, 13, 1),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          width: 1,
          strokeAlign: 1,
          color: Color.fromRGBO(99, 113, 222, 1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          width: 1,
          strokeAlign: 1,
          color: Color.fromRGBO(99, 113, 222, 1),
        ),
      ),
      hintStyle: const TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 16,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 16,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 14,
        letterSpacing: 0.04,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: FontFamily.tTNormsPro,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  @observable
  ThemeMode currentThemeType = ThemeMode.dark;

  @computed
  ThemeData get currentThemeData =>
      (currentThemeType == ThemeMode.light) ? _lightTheme : _darkTheme;

  @action
  void changeCurrentTheme() => {
        currentThemeType = (currentThemeType == ThemeMode.light)
            ? ThemeMode.dark
            : ThemeMode.light,
        Storage.saveTheme(currentThemeType.name)
      };

  @action
  void restoreTheme() {
    switch (Storage.restoreTheme()) {
      case String restore:
        currentThemeType =
            ThemeMode.values.firstWhere((mode) => restore == mode.name);
      case null:
        currentThemeType = ThemeMode.system;
    }
  }
}
