import 'package:flutter/material.dart';

import 'section_divider.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // Heading
        Text(
          'EDUCATION',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
            color: Colors.white70,
          ),
        ),
        SectionDivider(),

        // MBA
        Text(
          'MBA – Data Science',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Manipal Academy of Higher Education (MAHE)',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white60,
          ),
        ),
        Text(
          'Sep 2023 – Sep 2025',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white54,
          ),
        ),

        SizedBox(height: 18),

        // BBA
        Text(
          'Bachelor of Business Administration',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Chaudhary Charan Singh University (CCSU)',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white60,
          ),
        ),
        Text(
          'Jun 2011 – Jun 2014',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white54,
          ),
        ),

        SizedBox(height: 24),

        // Certificates Subsection
        Text(
          'CERTIFICATIONS',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.white60,
          ),
        ),
        SizedBox(height: 12),

        _CertificateItem(
          title: 'Flutter Development',
          issuer: 'Online Certification',
        ),
        _CertificateItem(
          title: 'Python & Django',
          issuer: 'Online Certification',
        ),
        _CertificateItem(
          title: 'Android Development (Kotlin)',
          issuer: 'Online Certification',
        ),
      ],
    );
  }
}

class _CertificateItem extends StatelessWidget {
  final String title;
  final String issuer;

  const _CertificateItem({
    required this.title,
    required this.issuer,
  });

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '• $title — $issuer',
        style: const TextStyle(
          fontFamily: _mono,
          fontSize: 13,
          height: 1.6,
          color: Colors.white60,
        ),
      ),
    );
  }
}
