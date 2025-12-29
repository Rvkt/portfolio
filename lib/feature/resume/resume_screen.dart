import 'package:flutter/material.dart';

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
              children: const [
                _Header(),
                SizedBox(height: 36),
                _Section('SUMMARY'),
                _Summary(),
                SizedBox(height: 32),
                _Section('SKILLS'),
                _Skills(),
                SizedBox(height: 32),
                _Section('EXPERIENCE'),
                _Experience(),
                SizedBox(height: 32),
                _Section('EDUCATION'),
                _Education(),
                SizedBox(height: 32),
                _Section('ATS KEYWORDS'),
                _ATSKeywords(),
                SizedBox(height: 48),
                _Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Ravi Kant',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Flutter • Android • Python Developer',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Email: rvkntin@gmail.com | GitHub: github.com/rvkt | LinkedIn: linkedin.com/in/rvkt',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white54,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  const _Section(this.title);

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: _mono,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.4,
        color: Colors.white70,
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter, Android, and Python Developer with hands-on experience in '
      'building scalable mobile applications and integrating RESTful APIs. '
      'Strong understanding of clean architecture, state management, and '
      'performance optimization. Proven ability to deliver maintainable, '
      'production-ready solutions across the full software development lifecycle.',
      style: TextStyle(
        fontFamily: _mono,
        fontSize: 14,
        height: 1.8,
        color: Colors.white70,
      ),
    );
  }
}

class _Skills extends StatelessWidget {
  const _Skills();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Text(
      '• Flutter (Dart)\n'
      '• Android Development (Kotlin, Java)\n'
      '• Python Development\n'
      '• State Management (Provider, Bloc)\n'
      '• REST API Integration\n'
      '• Firebase, SQL (Basic)\n'
      '• Clean Architecture, MVC, MVVM\n'
      '• Git, Version Control, Debugging\n'
      '• UI/UX Implementation\n'
      '• Performance Optimization',
      style: TextStyle(
        fontFamily: _mono,
        fontSize: 14,
        height: 1.8,
        color: Colors.white70,
      ),
    );
  }
}

class _Experience extends StatelessWidget {
  const _Experience();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Android / Flutter Developer\n'
      '• Developed and maintained cross-platform mobile applications.\n'
      '• Implemented responsive UI components using Flutter.\n'
      '• Integrated RESTful APIs and handled asynchronous data flows.\n'
      '• Applied clean architecture principles for scalable codebases.\n'
      '• Collaborated with designers and backend teams to deliver features.\n'
      '• Focused on code readability, performance, and long-term stability.',
      style: TextStyle(
        fontFamily: _mono,
        fontSize: 14,
        height: 1.8,
        color: Colors.white70,
      ),
    );
  }
}

class _Education extends StatelessWidget {
  const _Education();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Bachelor’s Degree in Computer Science\n'
      'University / College Name\n'
      'Year of Completion',
      style: TextStyle(
        fontFamily: _mono,
        fontSize: 14,
        height: 1.8,
        color: Colors.white70,
      ),
    );
  }
}

class _ATSKeywords extends StatelessWidget {
  const _ATSKeywords();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter Developer, Android Developer, Python Developer, Dart, Kotlin, '
      'Java, REST APIs, Mobile Application Development, State Management, '
      'Clean Architecture, MVVM, MVC, Firebase, SQL, Git, Agile, '
      'Performance Optimization, UI/UX, Cross-Platform Development',
      style: TextStyle(
        fontFamily: _mono,
        fontSize: 13,
        height: 1.8,
        color: Colors.white54,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '© 2025 Ravi Kant',
        style: TextStyle(
          fontFamily: _mono,
          fontSize: 12,
          color: Colors.white38,
        ),
      ),
    );
  }
}
