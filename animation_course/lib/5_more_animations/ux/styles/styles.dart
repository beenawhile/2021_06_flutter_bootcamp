import 'package:flutter/material.dart';

const darkBlue = Color(0xFF072448);
const teal = Color(0xFF54d2d2);
const mustard = Color(0xFFffcb00);
const sunset = Color(0xFFf8aa4b);
const salmon = Color(0xFFff6150);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: salmon),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: mustard,
    foregroundColor: Colors.black,
  ),
);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkBlue),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: salmon,
    foregroundColor: Colors.white,
  ),
);

Widget backgroundGradient(Color firstColor, Color secondColor) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
      colors: [
        firstColor,
        secondColor,
      ],
    )),
  );
}
