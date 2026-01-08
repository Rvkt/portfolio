import 'package:flutter/material.dart';
import 'package:portfolio/feature/resume/widgets/education.dart';
import 'package:portfolio/feature/resume/widgets/experience_widget.dart';
import 'package:portfolio/feature/resume/widgets/footer_widget.dart';
import 'package:portfolio/feature/resume/widgets/header_widget.dart';
import 'package:portfolio/feature/resume/widgets/skills.dart';
import 'package:portfolio/feature/resume/widgets/summary.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Resume',
          style: TextStyle(
            fontFamily: _mono,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              // TODO: Implement PDF download
              // Use: printing + pdf packages
            },
            icon: const Icon(Icons.download, color: Colors.white70),
            label: const Text(
              'Download PDF',
              style: TextStyle(
                fontFamily: _mono,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 36,
              children: const [
                AnimatedHeader(
                  child: Header(
                    name: 'Ravi Kant',
                    title: 'Flutter • Android • Python Developer',
                    contacts: [
                      HeaderContact(
                        label: 'Email',
                        value: 'rvkntin@gmail.com',
                        url: 'mailto:rvkntin@gmail.com',
                      ),
                      HeaderContact(
                        label: 'GitHub',
                        value: 'github.com/rvkt',
                        url: 'https://github.com/rvkt',
                      ),
                      HeaderContact(
                        label: 'LinkedIn',
                        value: 'linkedin.com/in/rvkt',
                        url: 'https://linkedin.com/in/rvkt',
                      ),
                    ],
                  ),
                ),
                Summary(),
                Skills(),
                Experience(),
                Education(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
