import 'package:flutter/material.dart';
import 'package:portfolio/feature/resume/widgets/section_divider.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  static const _mono = 'monospace';

  static const _skills = [
    'Flutter',
    'Dart',
    'Android',
    'Kotlin',
    'Java',
    'Python',
    'REST APIs',
    'Firebase',
    'SQL',
    'Provider',
    'Bloc',
    'UI/UX',
    'Clean Architecture',
    'MVVM',
    'MVC',
    'Git',
    'Debugging',
    'Performance Optimization',
    'Agile',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SKILLS',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: Colors.white70,
          ),
        ),
        SectionDivider(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _skills
              .map(
                (skill) => _SkillChip(label: skill),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: _mono,
          fontSize: 13,
          color: Colors.white70,
        ),
      ),
    );
  }
}
