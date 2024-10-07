import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCalendarCreation extends StatefulWidget {
  const GroupCalendarCreation({super.key});

  @override
  State<GroupCalendarCreation> createState() => _GroupCalendarCreationState();
}

class _GroupCalendarCreationState extends State<GroupCalendarCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Calendar View'),
        centerTitle: true,
        leading: TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Hủy')),
      ),
      body: Center(
        child: Text('This is Group Calendar View'),
      ),
    );
  }
}
