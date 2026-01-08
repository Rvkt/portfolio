import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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
