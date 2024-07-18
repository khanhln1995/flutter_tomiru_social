import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _testState();
}

class _testState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const Text('test');
  }
}
