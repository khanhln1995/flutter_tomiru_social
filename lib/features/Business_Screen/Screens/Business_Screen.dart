import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/business_appbar.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: BusinessAppBar(),
      body: Container(),
    );
  }
}