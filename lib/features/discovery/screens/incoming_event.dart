import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/discovery/widgets/incoming_slide.dart';

class IncomingEvent extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'event_name': 'Mở bán căn hộ Vinhome Smart giá ưu đãi sập sàn!',
      'tags': ['livestream','vinhome','hdhdhdhd','djhdhdhd'],
      'time': '13:00',
      'day': '30/08/2021',
      'seen_now': 165,
      'url': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/487807161.jpg?k=5b69e1c16573131174a8ae4c973f3d5f9005b0f53ef01d2c052dfbfc8f90fe08&o=&hp=1'
    },
    {
      'event_name': 'Mở bán Vinhome Blhhh giá ưu đãi sập sàn!',
      'tags': ['livestream','cuabuoi'],
      'time': '13:00',
      'day': '30/08/2021',
      'seen_now': 2000000000,
      'url': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/487807161.jpg?k=5b69e1c16573131174a8ae4c973f3d5f9005b0f53ef01d2c052dfbfc8f90fe08&o=&hp=1'
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
          child: Text('Sắp diễn ra',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 24.0),
          height: 280,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 4.0, left: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) {
              return HorizontalEventList(
                height: 270,
                eventName: events[index]['event_name'],
                eventTags: events[index]['tags'],
                time: events[index]['time'],
                day: events[index]['day'],
                image: events[index]['url'],
                seenNow: events[index]['seen_now']
              );
            },
          ),
        )
      ],
    );
  }
}
