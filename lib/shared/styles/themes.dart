import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:todo/shared/styles/colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor:mintgreen,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: primaryColor,
          secondary: Colors.blueAccent,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primaryColor,
          onBackground:Colors.grey,
          surface: Colors.blueGrey,
          onSurface: Colors.white),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ));
  static const Color darkprimary = Color(0xFF060E1E);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: Colors.indigo,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: darkprimary,
          onBackground:Colors.grey,
          surface:primaryColor,
          onSurface: Colors.white),
appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ));
}