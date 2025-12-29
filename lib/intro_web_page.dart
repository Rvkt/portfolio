import 'package:flutter/material.dart';
import 'package:portfolio/core/animations/particle_background.dart';
import 'package:url_launcher/url_launcher.dart';

import 'feature/resume/resume_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  static const _mono = 'monospace';

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 32,
                  vertical: isMobile ? 40 : 0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: FadeTransition(
                        opacity: _fade,
                        child: SlideTransition(
                          position: _slide,
                          child: _content(isMobile),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _content(bool isMobile) {
    return Column(
      mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),

        /// Avatar
        Container(
          width: isMobile ? 96 : 120,
          height: isMobile ? 96 : 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/avatar.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.white12),
          ),
        ),

        const SizedBox(height: 24),

        /// Name
        Text(
          'Hi, I’m Ravi Kant.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: _mono,
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 12),

        /// Role
        Text(
          'Flutter • Android • Python Developer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: _mono,
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 32),

        /// Divider
        Container(
          width: 80,
          height: 1,
          color: Colors.white12,
        ),

        const SizedBox(height: 32),

        /// Intro
        Text(
          'I build scalable, high-quality applications with a focus on clean '
          'architecture, performance, and long-term maintainability. My work '
          'spans mobile development and backend integration, delivering '
          'reliable, production-ready solutions.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: _mono,
            fontSize: isMobile ? 15 : 16,
            height: 1.7,
            color: Colors.white70,
          ),
        ),

        const SizedBox(height: 40),

        /// Actions (already responsive – keep as is)
        _actions(),

        const SizedBox(height: 56),

        /// Footer
        const Text(
          '© 2025 Ravi Kant',
          style: TextStyle(
            fontFamily: _mono,
            fontSize: 13,
            color: Colors.white38,
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _actions() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 520;

        final buttons = [
          _actionButton(
            label: 'Resume',
            icon: Icons.description_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ResumeScreen()),
              );
            },
          ),
          _actionButton(
            label: 'LinkedIn',
            icon: Icons.person,
            onTap: () {
              _openUrl('https://www.linkedin.com/in/rvkt');
            },
          ),
          _actionButton(
            label: 'GitHub',
            icon: Icons.code,
            onTap: () {
              _openUrl('https://github.com/rvkt');
            },
          ),
        ];

        if (isWide) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttons
                .map(
                  (b) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: b,
                  ),
                )
                .toList(),
          );
        }

        return Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 16,
          children: buttons,
        );
      },
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white24),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.white70),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: _mono,
                fontSize: 14,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
