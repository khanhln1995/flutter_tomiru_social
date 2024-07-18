import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';


import "package:tomiru_social_flutter/features/short_video/screens/create_short_video/picker_item.dart";
import 'package:provider/provider.dart';

class CreateShortVideoPage extends StatefulWidget {
  final GlobalKey scaffoldKey;
  final Key? refreshIndicatorKey;

  const CreateShortVideoPage({
    Key? key,
    required this.scaffoldKey,
    this.refreshIndicatorKey,
  }) : super(key: key);

  @override
  State<CreateShortVideoPage> createState() => _CreateShortVideoPageState();
}

class _CreateShortVideoPageState extends State<CreateShortVideoPage> {
  late AppState state;
  @override
  void initState() {
    super.initState();
    state = Provider.of<AppState>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: () async {
                      _showExitConfirmationDialog();
                    },
                  ),
                  Text(
                    'Tạo thước phim',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                      print("Settings icon pressed");
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.0,
                color: Colors.grey.shade200,
              )
            ],
          )),
      body: Column(
        children: [
          SizedBox(height: 20),
          ImageVideoPickerItem(),
        ],
      ),
    );
  }

  Future<void> _showExitConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Trở lại'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn muốn quay trở lại'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Không'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Có'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // setState(() {
                //   state.setPageIndex = 1;
                // });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(),
                //   ),
                // );
              },
            ),
          ],
        );
      },
    );
  }
}
