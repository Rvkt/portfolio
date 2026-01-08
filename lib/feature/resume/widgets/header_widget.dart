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

*/
