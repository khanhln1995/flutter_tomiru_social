import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/short_video/screens/short_video_page.dart';
import 'package:tomiru_social_flutter/common/widgets/global/image_slide.dart';


class HorizontalImageListScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> images = [
    {
      "url": "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg",
      "caption": "Caption 1",
      'showPlusButtonAdd': 'true',
      "userName": 'Trương Thanh Phong',
      "imageAvatarUrl":
          "https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=750&format=jpeg&optimize=medium",
    },
    {
      "url":
          "https://media.istockphoto.com/id/505239248/photo/humayun-tomb-new-delhi-india.jpg?s=612x612&w=0&k=20&c=UQTU6YOnVsSklzHi34cOhNW5AhsACDxKLiD9--T-3Kg=",
      "caption": "Caption 2",
      'showPlusButtonAdd': 'false',
      "userName": 'Trần Thị Thu',
      "imageAvatarUrl":
          "https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=750&format=jpeg&optimize=medium",
    },
    {
      "url":
          "https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg",
      "caption": "Caption 3",
      'showPlusButtonAdd': 'false',
      "userName": 'Hoàng Hồng Mai',
      "imageAvatarUrl":
          "https://imgupscaler.com/images/samples/Imgupscaler_1_2x.webp",
    },
    {
      "url":
          "https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg",
      "caption": "Caption 4",
      'showPlusButtonAdd': 'false',
      "userName": 'Trương Thanh Phong',
      "imageAvatarUrl":
          "https://img-cdn.pixlr.com/image-generator/history/65ba5701b4f4f4419f746bc3/806ecb58-167c-4d20-b658-a6a6b2f221e9/medium.webp",
    },
    {
      "url":
          "https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg",
      "caption": "Caption 5",
      'showPlusButtonAdd': 'false',
      "userName": 'Nguyễn Đắc Hiếu',
      "imageAvatarUrl":
          "https://assets.monica.im/tools-web/static/imageGeneratorFeatureIntro1-AQU1zYPO.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {

      return Container(
      height: 180,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> ShortVideoPage(scaffoldKey: _scaffoldKey,)));
              print('Tapped on item $index');
            },
            child: HorizontalImageItem(
              imageUrl: images[index]['url']!,
              showPlusButtonAdd: images[index]['showPlusButtonAdd']! == 'true',
              imageAvatarUrl: images[index]['imageAvatarUrl']!,
              userName: images[index]['userName']!,
              caption: images[index]['caption']!,
            ),
          );
        },
      ),
    );
  }
}
