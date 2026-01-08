import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// =======================
/// HEADER DATA MODEL
/// =======================
class HeaderContact {
  final String label;
  final String value;
  final String url;

  const HeaderContact({
    required this.label,
    required this.value,
    required this.url,
  });
}

/// =======================
/// ANIMATED HEADER WRAPPER
/// =======================
class AnimatedHeader extends StatefulWidget {
  final Widget child;

  const AnimatedHeader({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
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
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
    );
  }
}

/// =======================
/// HEADER ROOT WIDGET
/// =======================
class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
    required this.title,
    required this.contacts,
  });

  final String name;
  final String title;
  final List<HeaderContact> contacts;

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderName(name: name),
        const SizedBox(height: 6),
        _HeaderTitle(title: title),
        const SizedBox(height: 10),
        _HeaderContacts(contacts: contacts),
      ],
    );
  }
}

/// =======================
/// NAME
/// =======================
class _HeaderName extends StatelessWidget {
  final String name;

  const _HeaderName({required this.name});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontFamily: _mono,
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

/// =======================
/// TITLE
/// =======================
class _HeaderTitle extends StatelessWidget {
  final String title;

  const _HeaderTitle({required this.title});

  static const _mono = 'monospace';

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: _mono,
        fontSize: 16,
        color: Colors.white70,
      ),
    );
  }
}

/// =======================
/// CLICKABLE CONTACTS
/// =======================
class _HeaderContacts extends StatelessWidget {
  final List<HeaderContact> contacts;

  const _HeaderContacts({required this.contacts});

  static const _mono = 'monospace';

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 6,
      children: contacts.map((contact) {
        return InkWell(
          onTap: () => _openUrl(contact.url),
          child: Text(
            '${contact.label}: ${contact.value}',
            style: const TextStyle(
              fontFamily: _mono,
              fontSize: 14,
              color: Colors.white54,
              height: 1.6,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// =======================
/// USAGE EXAMPLE
/// =======================
/*
AnimatedHeader(
  child: Header(
    name: 'Ravi Kant',
    title: 'Flutter • Android • Python Developer',
    contacts: const [
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
*/
