import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tomiru_social_flutter/common/widgets/global/buildAvatarWidget.dart';

class HorizontalImageItem extends StatelessWidget {
  final String imageUrl;
  final String imageAvatarUrl;
  final String caption;
  final String userName;
  final bool showPlusButtonAdd;
  const HorizontalImageItem({
    Key? key,
    required this.imageUrl,
    required this.caption,
    this.userName = '',
    required this.imageAvatarUrl,
    this.showPlusButtonAdd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 100,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                if (!showPlusButtonAdd)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                if (!showPlusButtonAdd)
                  BuildAvatarWidget(
                    urlAvatar: imageAvatarUrl,
                    border: true,
                  ),
                if (!showPlusButtonAdd)
                  Padding(
                    padding: EdgeInsets.only(top: 110, left: 5),
                    child: Text(
                      userName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                if (showPlusButtonAdd)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(color: Colors.blue[50], borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 50, left: 5),
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Plus button pressed~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                                  print('Plus button pressed~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                                },
                                child: Icon(Icons.add,
                                    size: 35, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Text(
                            'Tạo tin',
                            style: TextStyle(
                                color: Color(0xff314768),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
