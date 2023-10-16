import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 90, 6, 146));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  color: kColorScheme.onSecondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
