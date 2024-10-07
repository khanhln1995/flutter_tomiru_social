import 'package:flutter/material.dart';

class BodyReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
         
          Expanded(
            child: ListView.builder(
              itemCount: 2, // For example, if you want to repeat it twice
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            '09/07/2024 - Thứ Ba',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                         
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Calendar_empty.png', // Replace with your empty state image
                              height: 100,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Bạn chưa sự kiện nào',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Hãy tạo sự kiện để có một trải nghiệm tốt nhất.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Bottom Navigation Bar
         
        ],
      ),
    );
  }
}

