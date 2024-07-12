import 'package:flutter/material.dart';

class LoadCommentWidget extends StatelessWidget {
  final Function(String) onOptionSelected;
  final Map<String, dynamic> data;

  LoadCommentWidget({required this.onOptionSelected, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Avatar and comment content
          Row(
            children: [
              BuildAvatarWidget2(
                urlAvatar: data['avatar'],
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 8, // Chiếm 85%
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffECECEC),
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              data['userName'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              data['comment'][0],
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text('Thích', style: TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {},
                          child:
                              const Text('Trả lời', style: TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          '5 giờ trước',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1, // Chiếm 5%
                child: SizedBox(width: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildAvatarWidget2 extends StatelessWidget {
  final String urlAvatar;
  final double width;
  final double height;

  const BuildAvatarWidget2({super.key, 
    required this.urlAvatar,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(urlAvatar),
        ),
      ),
    );
  }
}
