import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const IntroWebPage(),
    );
  }
}

class IntroWebPage extends StatefulWidget {
  const IntroWebPage({super.key});

  @override
  State<IntroWebPage> createState() => _IntroWebPageState();
}

class _IntroWebPageState extends State<IntroWebPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: FadeTransition(
                  opacity: _fade,
                  child: SlideTransition(position: _slide, child: _content()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(color: Colors.amber.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
          child: const Text(
            '🚧 UNDER MAINTENANCE',
            style: TextStyle(color: Colors.amber, fontSize: 12, letterSpacing: 1.2, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 24),

        /// Heading
        const Text(
          'Hi, I’m Ravi Kant 👋',
          style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white),
        ),

        const SizedBox(height: 12),

        /// Subheading
        const Text('Flutter • Android • Backend Developer', style: TextStyle(fontSize: 20, color: Colors.white70)),

        const SizedBox(height: 28),

        /// Description
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),
          child: const Text(
            'This portfolio website is currently under maintenance.\n'
            'I am refining projects, case studies, and technical details.\n\n'
            'Please contact me only for professional queries or collaborations.',
            style: TextStyle(fontSize: 16, height: 1.7, color: Colors.white70),
          ),
        ),

        const SizedBox(height: 28),

        /// Contact
        Row(
          children: const [
            Icon(Icons.email_outlined, color: Colors.lightBlueAccent),
            SizedBox(width: 10),
            SelectableText(
              'rvkntin@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent, fontWeight: FontWeight.w500),
            ),
          ],
        ),

        const SizedBox(height: 40),

        const Text('© 2025 Ravi Kant', style: TextStyle(fontSize: 13, color: Colors.white38)),
      ],
    );
  }
}

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Particle> _particles = List.generate(50, (_) => _Particle.random());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        for (final p in _particles) {
          p.update();
        }
        return CustomPaint(size: MediaQuery.of(context).size, painter: _ParticlePainter(_particles));
      },
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white10;
    for (final p in particles) {
      canvas.drawCircle(Offset(p.x * size.width, p.y * size.height), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

class _Particle {
  double x, y, speed, radius;

  _Particle(this.x, this.y, this.speed, this.radius);

  factory _Particle.random() {
    final r = Random();
    return _Particle(r.nextDouble(), r.nextDouble(), 0.0003 + r.nextDouble() * 0.0006, 1.5 + r.nextDouble() * 2.5);
  }

  void update() {
    y -= speed;
    if (y < 0) y = 1;
  }
}
