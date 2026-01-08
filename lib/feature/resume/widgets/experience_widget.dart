import 'package:flutter/material.dart';

import 'section_divider.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // Heading
        Text(
          'EXPERIENCE',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: Colors.white70,
          ),
        ),
        SectionDivider(),

        // Experience 1
        _ExperienceItem(
          role: 'Flutter Developer',
          company: 'Softmint India Pvt. Ltd.',
          duration: 'Dec 2023 – Present',
          projects: 'Flashmart, Easygold App, Softmint App',
          points: [
            'Designed and developed high-performance cross-platform applications using Flutter and Dart.',
            'Delivered pixel-perfect UIs aligned with Material Design standards.',
            'Integrated RESTful APIs for secure and efficient data flow.',
            'Implemented token-based authentication using Shared Preferences.',
            'Optimized application performance using Flutter DevTools, achieving a 20% improvement.',
            'Designed engaging UI/UX using Figma and Adobe Illustrator.',
            'Integrated native Android features via Kotlin and Method Channels.',
            'Conducted code reviews and collaborated using GitHub and Jira.',
          ],
        ),

        SizedBox(height: 24),

        // Experience 2
        _ExperienceItem(
          role: 'Flutter Developer & Python Developer',
          company: 'Inkronix Pvt. Ltd.',
          duration: 'Jul 2022 – Dec 2023',
          projects: 'Alphabell Agrofood App, News Scraper',
          points: [
            'Developed responsive Flutter applications with optimized Dart code.',
            'Built scalable backend services using Django Rest Framework and SQL.',
            'Integrated third-party APIs and external services.',
            'Implemented secure authentication using Django and Firebase.',
          ],
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String projects;
  final List<String> points;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.projects,
    required this.points,
  });

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role,
          style: const TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$company | $duration',
          style: const TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white60,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Projects: $projects',
          style: const TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 12),
        ...points.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              '• $point',
              style: const TextStyle(
                fontFamily: _mono,
                fontSize: 13,
                height: 1.6,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
