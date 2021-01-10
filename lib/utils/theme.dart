import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    fontFamily: 'Quicksand',
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.purple,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
    appBarTheme: _appBarTheme(),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
