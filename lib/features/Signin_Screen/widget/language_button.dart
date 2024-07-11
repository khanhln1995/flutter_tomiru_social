import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: PopupMenuButton<String>(
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Tiếng Việt',
            child: Text('Tiếng Việt'),
          ),
          const PopupMenuItem<String>(
            value: 'English',
            child: Text('English'),
          ),
          const PopupMenuItem<String>(
            value: 'Other Languages',
            child: Text('Other Languages'),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.language, color: Colors.grey),
            SizedBox(width: 2),
            Text('Tiếng Việt'),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
