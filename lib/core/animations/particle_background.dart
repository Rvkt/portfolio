import 'dart:math';

import 'package:flutter/material.dart';

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
