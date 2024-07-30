import 'package:flutter/material.dart';

class HeaderGroup2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              stops: [0.2, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            // Bọc Image trong Container
            width: double.infinity, // Chiều rộng mong muốn
            height: 300, // Chiều cao mong muốn
            child: Image.asset(
              'assets/images/Firefly.png',
              fit: BoxFit
                  .cover, // Điều chỉnh cách ảnh được hiển thị trong Container
            ),
          ),
        ),


        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Container(
                // Bọc RichText trong Container
                width:
                    220, // Hoặc sử dụng constraints: BoxConstraints(maxWidth: 200),
                child: RichText(
                  textAlign: TextAlign.center, // Căn giữa văn bản
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hôm nay vào 14:00\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Sự kiện khai\ntrương cửa hàng\n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Sự kiện của Tony Nguyen và Tomiru',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 4),
            ],
          ),
        ),
        // Nút back
        Positioned(
          top: 40,
          left: 10,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 84, 84, 84)
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              iconSize: 20,
              padding: const EdgeInsets.all(8),
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
