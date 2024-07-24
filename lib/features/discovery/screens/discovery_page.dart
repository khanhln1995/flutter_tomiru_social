import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/discovery/screens/body_discovery_page.dart';
import 'package:tomiru_social_flutter/widgets/custom_icon_widgets.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(230, 236, 240, 1.0),
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: 'Khám phá',
        padding: 0,
        widget: [
          customSetting(),
          customMessage(),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BodyDiscoveryPage(),
      )),
    );
  }
}
