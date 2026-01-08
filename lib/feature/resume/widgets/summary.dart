import 'package:flutter/material.dart';

import 'section_divider.dart';

class Summary extends StatelessWidget {
  const Summary();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'SUMMARY',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: Colors.white70,
          ),
        ),
        SectionDivider(),
        Text(
          'Flutter Developer and Android Developer with strong experience in '
          'cross-platform mobile application development using Dart, Kotlin, and Java. '
          'Skilled in building scalable, production-ready applications with clean '
          'architecture patterns such as MVVM and MVC, effective state management, '
          'and seamless REST API integration. Experienced in Firebase, SQL, Git, '
          'and Agile development practices, with a consistent focus on performance '
          'optimization, UI/UX implementation, and maintainable codebases across '
          'the full software development lifecycle.',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            height: 1.8,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
