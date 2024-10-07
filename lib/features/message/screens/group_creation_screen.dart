import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCreation extends StatefulWidget {
  const GroupCreation({super.key});

  @override
  State<GroupCreation> createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group View'),
        centerTitle: true,
        leading: TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Hủy')),
      ),
      body: Center(
        child: Text('This is Group View'),
      ),
    );
  }
}
