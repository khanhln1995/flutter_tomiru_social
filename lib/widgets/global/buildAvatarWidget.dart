import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildAvatarWidget extends StatefulWidget {
  final String urlAvatar;
  final int height;
  final int width;
  final bool border;
  const BuildAvatarWidget({
    Key? key,
    required this.urlAvatar,
    this.height = 50,
    this.width = 50,
    this.border = false,
  }) : super(key: key);

  @override
  State<BuildAvatarWidget> createState() => _buildAvatarWidgetState();
}

class _buildAvatarWidgetState extends State<BuildAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: Container(
        height: widget.height.toDouble(),
        width: widget.width.toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border:
              widget.border ? Border.all(color: Colors.blue, width: 2) : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: CachedNetworkImage(
            imageUrl: widget.urlAvatar,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
