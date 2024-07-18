import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/quantity_converter.dart';

class HorizontalEventList extends StatelessWidget {
  final double height;
  final String eventName;
  final List<String> eventTags;
  final String time;
  final String day;
  final String image;
  final int seenNow;

  const HorizontalEventList({
    super.key,
    required this.eventName,
    required this.eventTags,
    required this.day,
    required this.time,
    required this.image,
    required this.seenNow,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 3 / 4;
    return Container(
      color: const Color.fromRGBO(246, 248, 249, 1),
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  image,
                  width: width,
                  height: height * 11 / 20,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'LIVE',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.remove_red_eye,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        QuantityConverter.convertNum(seenNow),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 40, // Fixed height 
                child: Text(
                  eventName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: eventTags
                            .take(2)
                            .map((tag) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '#$tag',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                      ),
                      Text(
                        '$time - $day',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Color.fromRGBO(29, 155, 240, 1))
                      ),
                      onPressed: () {},
                      label: const Text("Nhắc tôi", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
                      icon: const Icon(Icons.notifications_active_outlined, color: Colors.white, size: 16,))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
