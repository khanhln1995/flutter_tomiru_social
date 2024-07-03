import 'package:flutter/material.dart';

class GroupImageList extends StatelessWidget {
  final List<Map<String, String>> images = [
    {
      "url": "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg",
      "caption":
          "Bất động sản Việt Nam là một trong những lĩnh vực kinh tế quan trọng tại Việt Nam, góp phần lớn vào GDP của quốc gia.",
      "imageAvatarUrl":
          "https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=750&format=jpeg&optimize=medium",
    },
    {
      "url":
          "https://media.istockphoto.com/id/505239248/photo/humayun-tomb-new-delhi-india.jpg?s=612x612&w=0&k=20&c=UQTU6YOnVsSklzHi34cOhNW5AhsACDxKLiD9--T-3Kg=",
      "caption": "Bất động sản Việt Nam",
      "imageAvatarUrl":
          "https://www.adobe.com/acrobat/hub/media_173d13651460eb7e12c0ef4cf8410e0960a20f0ee.jpeg?width=750&format=jpeg&optimize=medium",
    },
    {
      "url":
          "https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg",
      "caption": "Bất động sản Việt Nam",
      "imageAvatarUrl":
          "https://imgupscaler.com/images/samples/Imgupscaler_1_2x.webp",
    },
    {
      "url":
          "https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg",
      "caption": "Bất động sản Việt Nam",
      "imageAvatarUrl":
          "https://img-cdn.pixlr.com/image-generator/history/65ba5701b4f4f4419f746bc3/806ecb58-167c-4d20-b658-a6a6b2f221e9/medium.webp",
    },
    {
      "url":
          "https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg",
      "caption": "Bất động sản Việt Nam",
      "imageAvatarUrl":
          "https://assets.monica.im/tools-web/static/imageGeneratorFeatureIntro1-AQU1zYPO.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130, // Increase the height here
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.0), // Add padding here
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GroupImageItem(
            imageUrl: images[index]['url']!,
            caption: images[index]['caption']!,

            width: 100, // Set the desired width here
          );
        },
      ),
    );
  }
}

class GroupImageItem extends StatelessWidget {
  final String imageUrl;
  final String caption;

  final double width;

  GroupImageItem({
    Key? key,
    required this.imageUrl,
    required this.caption,
    this.width = 100, // Default width if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Use the provided width here
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0, // Align to the bottom
            left: 8.0,
            right: 8.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.transparent, // Transparent background
              child: Text(
                caption,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
