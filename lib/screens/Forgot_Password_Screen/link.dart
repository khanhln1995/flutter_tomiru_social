import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkExample extends StatelessWidget {
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(0, 0))),
      onPressed: _launchUrl,
      child: Text(
        'Không phải tôi?',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontFamily: "Avenir",
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
