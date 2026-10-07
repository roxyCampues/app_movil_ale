import 'package:flutter/material.dart';

import 'navigation/main_navigation.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMEXSIS',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const MainNavigation(),
    );
  }
}
