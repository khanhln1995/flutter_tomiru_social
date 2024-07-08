import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Body_Feed_Screen.dart';

class FeedPage extends StatelessWidget {
  FeedPage({Key? key, required this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 236, 240, 1.0),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            key: refreshIndicatorKey,
            onRefresh: () async {
              /// refresh home page feed
              // var feedState = Provider.of<FeedState>(context, listen: false);
              // feedState.getDataFromDatabase();
              // return Future.value(true);
            },
            child: FeedPageBody(
              refreshIndicatorKey: refreshIndicatorKey,
              scaffoldKey: scaffoldKey,
            ),
          ),
        ),
      ),
    );
  }
}
