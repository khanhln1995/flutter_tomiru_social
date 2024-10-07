import 'package:flutter/material.dart';

class TopNotification extends StatefulWidget {
  final String message;
  final AnimationController animationController;

  const TopNotification({
    Key? key,
    required this.message,
    required this.animationController,
  }) : super(key: key);

  @override
  _TopNotificationState createState() => _TopNotificationState();
}

class _TopNotificationState extends State<TopNotification> {
  @override
  void initState() {
    super.initState();
    widget.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double notificationWidth = screenWidth / 2;
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return Opacity(
          opacity: widget.animationController.value,
          child: Transform.translate(
            offset: Offset(0, -50 * (1 - widget.animationController.value)),
            child: Container(
              width: notificationWidth,
              height: 40,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.notification_important,
                    color: Colors.white, // Set your desired icon color here
                  ),
                  Text(
                    widget.message,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NotifyBottomSheet extends StatelessWidget {
  final VoidCallback onAction;

  const NotifyBottomSheet({
    Key? key,
    required this.onAction,
  }) : super(key: key);

  Widget titleModel(BuildContext context, IconData icon, String title) {
    double iconSize = MediaQuery.of(context).size.width * 0.065;
    double sizedBoxWidth = MediaQuery.of(context).size.width * 0.032;
    double fontSize = MediaQuery.of(context).size.width * 0.039;
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(width: sizedBoxWidth),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.25, // Adjust the height as needed
      padding: const EdgeInsets.all(16.0), // Add padding around the content
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Tùy chọn bình luận",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
            thickness: 0.5,
            endIndent: 0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 50,
            child: ListTile(
              title: titleModel(context, Icons.checklist, "Đánh dấu là đã đọc"),
              onTap: () {
                // Handle mark as read event
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: ListTile(
              title: titleModel(context, Icons.delete, "Xóa thông báo này"),
              onTap: () {
                Navigator.pop(context);
                onAction(); // Show notification
              },
            ),
          ),
        ],
      ),
    );
  }
}
