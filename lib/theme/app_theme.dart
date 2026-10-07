import 'package:flutter/material.dart';

const purple = Color(0xFF28176F);
const pageBackground = Color(0xFFF6F5FA);

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: pageBackground,
    colorScheme: ColorScheme.fromSeed(seedColor: purple),
    fontFamily: 'Roboto',
  );
}
