import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/Rectangle 191.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -55,
          child: CircleAvatar(
            radius: 65,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/mark-zuckerberg.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: -120,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Tony Nguyen',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                '11K người theo dõi | 0 đang theo dõi',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        // Nút back
        Positioned(
          top: 40,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,     
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              iconSize: 20,
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              splashRadius: 20,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
