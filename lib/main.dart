import 'package:flutter/material.dart';
import 'package:portfolio/intro_web_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ravi Kant | Portfolio',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: const Color(0xFF020617)),
      home: const IntroScreen(),
    );
  }
}
