import 'package:flutter/material.dart';

class SectionDivider extends StatefulWidget {
  const SectionDivider({super.key});

  @override
  State<SectionDivider> createState() => _SectionDividerState();
}

class _SectionDividerState extends State<SectionDivider> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _widthAnimation = Tween<double>(begin: 0, end: 48).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
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
    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (_, __) {
        return Container(
          margin: const EdgeInsets.only(top: 8, bottom: 16),
          width: _widthAnimation.value,
          height: 1,
          color: Colors.white.withOpacity(0.18),
        );
      },
    );
  }
}
