import 'package:flutter/material.dart';

class AppTheme {
  static var darkTheme;

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      cardTheme: CardTheme(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}