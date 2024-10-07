import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/state/home_controller.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_button.dart';
import 'package:tomiru_social_flutter/features/short_video/screens/create_short_video/create_short_video_page.dart';

class BoxPositionTop extends StatefulWidget {
  final GlobalKey scaffoldKey;

  const BoxPositionTop({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<BoxPositionTop> createState() => _BoxPositionTopState();
}

class _BoxPositionTopState extends State<BoxPositionTop> {
  final HomeController homeController = Get.find<HomeController>();
  int actionPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                homeController.setPageIndex(0); // Use function from HomeController
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 25),
              CustomButton(
                content: 'Dành cho bạn',
                backgroundColor: actionPage == 0
                    ? Colors.white
                    : Colors.white.withOpacity(0.0),
                isEnabled: true,
                borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textStyle: TextStyle(
                    fontSize: 12,
                    color: actionPage == 0 ? Colors.black : Colors.white),
                height: 30,
                padding: 10.0,
                action: () => {
                  setState(() {
                    actionPage = 0;
                  })
                },
              ),
              SizedBox(width: 10),
              CustomButton(
                content: 'Đang theo dõi',
                backgroundColor: actionPage == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.0),
                isEnabled: true,
                borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textStyle: TextStyle(
                    fontSize: 12,
                    color: actionPage == 1 ? Colors.black : Colors.white),
                height: 30,
                padding: 10.0,
                action: () => {
                  setState(() {
                    actionPage = 1;
                  })
                },
              ),
              SizedBox(width: 10),
              CustomButton(
                content: 'Gần đây',
                backgroundColor: actionPage == 2
                    ? Colors.white
                    : Colors.white.withOpacity(0.0),
                isEnabled: true,
                padding: 10.0,
                borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textStyle: TextStyle(
                    fontSize: 12,
                    color: actionPage == 2 ? Colors.black : Colors.white),
                height: 30,
                action: () => {
                  setState(() {
                    actionPage = 2;
                  })
                },
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 70, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    width: 100.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Create',
                            style: TextStyle(fontSize: 13),
                          ),
                        ]),
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateShortVideoPage(
                          scaffoldKey: widget.scaffoldKey,
                        ),
                      ),
                    ),
                  },
                ),
                SizedBox(width: 10),
                GestureDetector(
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => {},
                ),
              ],
            )),
      ],
    );
  }
}
