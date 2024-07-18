import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/quantity_converter.dart';

class HorizontalStreaming extends StatelessWidget {
  final String image;
  final int seenNow;
  final String intro;
  final double height;
  const HorizontalStreaming(
      {super.key,
      required this.image,
      required this.seenNow,
      required this.intro,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: height * 4 / 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: height,
              width: height * 4 / 5,
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    color: Colors.red,
                    child: const Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    color: Colors.black54,
                    child: Text(
                      '${QuantityConverter.convertNum(seenNow)} đang xem',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                intro,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
