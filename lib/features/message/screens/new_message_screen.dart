import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message View'),
        centerTitle: true,
        leading: TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Hủy')),
      ),
      body: Center(
        child: Text('This is New Message View'),
      ),
    );
  }
}
