import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HorizontalContactMember extends StatelessWidget {
  final String avatar;
  final String username;
  final String role;
  final int mutual_friend;
  final int mutual_group;
  const HorizontalContactMember(
      {super.key,
      required this.avatar,
      required this.username,
      required this.role,
      this.mutual_friend = 0,
      this.mutual_group = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 24.0, 0),
      margin: EdgeInsets.only(right: 12.0),
      width: MediaQuery.of(context).size.width * 3 / 4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(avatar),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "28 phut",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 4.0),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '• $role',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    if (mutual_friend > 0)
                    Text(mutual_group > 0 ?
                      '$mutual_friend bạn chung - ' : '$mutual_friend bạn chung',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    if (mutual_group > 0)
                    Text(
                      '$mutual_group nhóm chung',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Nhắn tin',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[50],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Gọi điện',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[50],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
