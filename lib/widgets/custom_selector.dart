import 'package:flutter/material.dart';

class CustomSelector extends StatefulWidget {
  final dynamic iconOrImage; // Can be IconData or String for image path
  final String title;
  final String content;
  final VoidCallback onTap;
  final bool isSelected;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomSelector({
    Key? key,
    this.iconOrImage,
    required this.title,
    this.content = '',
    required this.onTap,
    required this.isSelected,
    this.height = 50.0,
    this.borderRadius = 5.0,
    this.backgroundColor = Colors.white,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  _CustomSelectorState createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.isSelected ? const Color(0xFFFFD200) : const Color(0xFFD8D8D8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconOrImage != null && widget.iconOrImage is IconData)
                Icon(widget.iconOrImage as IconData)
              else if (widget.iconOrImage != null &&
                  widget.iconOrImage is String)
                Image.asset(
                  widget.iconOrImage as String,
                  height: 24,
                  width: 24,
                ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: widget.content.isNotEmpty
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                    ),
                  ),
                  if (widget.content.isNotEmpty)
                    Text(
                      widget.content,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.isSelected
                        ? const Color(0xFFFFD200)
                        : const Color(0xFFD8D8D8),
                    width: 2,
                  ),
                ),
                child: widget.isSelected
                    ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD200),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
