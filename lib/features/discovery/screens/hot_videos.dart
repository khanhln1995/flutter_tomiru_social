import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/camera/screen/livestream_screen.dart';
import 'package:tomiru_social_flutter/features/discovery/widgets/live_slide.dart';

class HotVideos extends StatelessWidget {
  final int index;
  HotVideos({super.key, required this.index});
  final List<Map<String, dynamic>> hotVideos = [
    {
      'image':
          'https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg',
      'seen_now': 20000,
      'intro': 'Livestream giới thiệu dự án Vinhome Smart City'
    },
    {
      'image':
          'https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg',
      'seen_now': 15000,
      'intro': 'Livestream giới thiệu dự án Vinhome Smart City'
    },
    {
      'image':
          'https://st3.depositphotos.com/1005145/15351/i/450/depositphotos_153516954-stock-photo-summer-landscape-with-flowers-in.jpg',
      'seen_now': 2000,
      'intro': 'Livestream giới thiệu dự án Vinhome Smart City'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(index == 0 ? 'Hot videos' : 'Top hot videos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 24.0),
          height: 270,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: hotVideos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LivePage(isHost: false, userID: "Khanh"),
                    ),
                  );
                },
                child: HorizontalStreaming(
                  height: 270,
                  image: hotVideos[index]['image'],
                  seenNow: hotVideos[index]['seen_now'],
                  intro: hotVideos[index]['intro'],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
