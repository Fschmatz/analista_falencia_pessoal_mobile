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
      secondary: Color(0xFF3D6BAC),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 1,
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
      backgroundColor: Color(0xFF3D6BAC),
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: const Color(0xFF3D6BAC),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF3D6BAC),
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(4.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(4.0))),
    bottomAppBarColor: const Color(0xFFF0F2F2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Color(0xFF3D6BAC),
      ),
      selectedLabelStyle: TextStyle(
        color: Color(0xFF3D6BAC),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFFF0F2F2),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFF0F2F2),
        indicatorColor: const Color(0xFF3D6BAC),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFF0F2F2)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A1B1F),
    scaffoldBackgroundColor: const Color(0xFF1A1B1F),
    canvasColor: const Color(0xFF1A1B1F),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF1A1B1F),
        primary: Color(0xFFA8C7FF),
        secondary: Color(0xFFA8C7FF)),
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      color: Color(0xFF303136),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1A1B1F),
      color: Color(0xFF1A1B1F),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFF292A2F),
      color: Color(0xFF292A2F),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF1A1B1F),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF353537),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA8C7FF),
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(4.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(4.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xFFA8C7FF)),
      selectedLabelStyle: TextStyle(color: Color(0xFFA8C7FF)),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF1A1B1F),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFA8C7FF),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF1A1B1F),
        indicatorColor: const Color(0xFFA8C7FF),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFEAEAEA),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
    bottomAppBarColor: const Color(0xFF1A1B1F),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF1A1B1F)));
