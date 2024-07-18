import 'package:flutter/material.dart';

class HeaderGroup extends StatelessWidget {
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
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ),
        Positioned(
          bottom: -140,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Tomiru_Team',
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        'assets/images/mark-zuckerberg.jpg'),
                  ),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        'assets/images/mark-zuckerberg.jpg'),
                  ),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        'assets/images/mark-zuckerberg.jpg'),
                  ),
                  SizedBox(width: 4),
                  // Text('Mạnh, Long, Phượng và 2.546.515 \n người khác thích địa điểm này'),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mạnh, Long, Phượng và 2.546.515',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'người khác thích địa điểm này',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ])
                ],
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
