import 'package:flutter/material.dart';

class ActionButtons extends StatefulWidget {
  @override
  _ActionButtonsState createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  bool _isFriendRequestSent = false;

  void _sendFriendRequest() {
    setState(() {
      _isFriendRequestSent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 42,
              child: ElevatedButton(
                onPressed: _isFriendRequestSent ? null : _sendFriendRequest,
                child: Text(
                  _isFriendRequestSent ? 'Đã gửi lời mời' : 'Kết bạn',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  backgroundColor:
                      _isFriendRequestSent ? Colors.grey[200] : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 42,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Theo dõi',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.grey),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
