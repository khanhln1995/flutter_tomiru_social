import 'package:flutter/material.dart';

class StreamingMembers extends StatelessWidget {
  final List<Map<String, dynamic>> mems = [
    {
      'image':
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/anh-dep-thien-nhien-2-1.jpg',
      'description': 'Story',
      'streaming': false
    },
    {
      'image':
          'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/anh-dep-thien-nhien-2-1.jpg',
      'description': 'Hot live',
      'streaming': true
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 70,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: mems[index]['streaming']
                                      ? Colors.transparent
                                      : Colors.blue, // Màu viền 
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: mems[index]['image'].isNotEmpty
                                    ? NetworkImage(mems[index]['image'])
                                    : null,
                                child: mems[index]['image'].isEmpty
                                    ? Icon(Icons.person,
                                        size: 30, color: Colors.grey[600])
                                    : null,
                              ),
                            ),
                            if (mems[index]['streaming'])
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(238, 61, 72, 1),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: const Text(
                                    "Live",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mems[index]['description'],
                        style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
