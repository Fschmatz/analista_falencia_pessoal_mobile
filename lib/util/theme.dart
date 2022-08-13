import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFF0F2F2),
    canvasColor: const Color(0xFFF0F2F2),
    scaffoldBackgroundColor: const Color(0xFFF0F2F2),
    colorScheme: const ColorScheme.light(
      background: Color(0xFFF0F2F2),
      primary: Color(0xFF3D6BAC),
      onPrimary: Color(0xFF0D1D29),
      secondary: Color(0xFF3D6BAC),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      color: Color(0xFFF5F7F7),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF0F2F2),
      surfaceTintColor: Color(0xFFF0F2F2),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFFFDFFFF),
      color: Color(0xFFFDFFFF),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFDFFFF),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFD5E4F6),
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: const Color(0xFF3D6BAC),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF3D6BAC),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF74777F),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color:  Color(0xFF74777F),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomAppBarColor: const Color(0xFFF0F2F2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF0F2F2),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFF0F2F2),
        indicatorColor: const Color(0xFFD5E4F6),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF0D1D29),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF0D1D29), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFF0F2F2)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1B1B1D),
    scaffoldBackgroundColor: const Color(0xFF1B1B1D),
    canvasColor: const Color(0xFF1B1B1D),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF1B1B1D),
        primary: Color(0xFFA8C7FF),
        onPrimary: Color(0xFFD5E4F6),
        secondary: Color(0xFFA8C7FF)),
    popupMenuTheme: const PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      color: Color(0xFF323234),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1B1B1D),
      color: Color(0xFF1B1B1D),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFF2B2B2D),
      color: Color(0xFF2B2B2D),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF1B1B1D),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF353537),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA8C7FF),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF8D9099),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF8D9099),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(

      backgroundColor: Color(0xFF1B1B1D),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF3A5470),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF1B1B1D),
        indicatorColor: const Color(0xFF394757),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFD5E4F6),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFD5E4F6), fontWeight: FontWeight.w500))),
    bottomAppBarColor: const Color(0xFF1B1B1D),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF1B1B1D)));
