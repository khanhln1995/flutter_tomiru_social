import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Screens/Invite_Members_Screen.dart';
import 'package:tomiru_social_flutter/features/group/Screens/manage_group_screen.dart';

class ButtonGroup extends StatefulWidget {
  final bool isJoined;
  final bool isAdmin;
  final Function(bool value) isJoinGroup;
  const ButtonGroup(
      {super.key,
      required this.isJoinGroup,
      required this.isJoined,
      required this.isAdmin});

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Image.asset("assets/images/Group 13114.png"),
                title: const Text(
                  'Bỏ theo dõi nhóm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/pushpin 1.png",
                  width: 24,
                  height: 24,
                ),
                title: const Text(
                  'Ghim nhóm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/Group 10277.png"),
                title: const Text(
                  'Chia sẻ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/Group 13189.png"),
                title: const Text(
                  'Nhận thông báo cho nội dung mới',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/flag 1.png"),
                title: const Text(
                  'Báo cáo nhóm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
              ListTile(
                leading: Image.asset("assets/images/log-out 1.png"),
                title: const Text(
                  'Rời khỏi nhóm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  // Handle the action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              if (!widget.isJoined && !widget.isAdmin)
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.isJoinGroup(true);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Tham gia nhóm',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.isJoined || widget.isAdmin) ...[
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        !widget.isAdmin
                            ? null
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageGroupScreen(
                                          isAdmin: true,
                                        )));
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        !widget.isAdmin ? 'Đã Tham Gia' : 'Quản lý',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InviteMembersScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Mời',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              if (!widget.isJoined) ...[
                const SizedBox(width: 10),
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                      _showSettingsMenu(context);
                    },
                  ),
                ),
              ],
              if (widget.isJoined) ...[
                const SizedBox(width: 5),
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                      _showSettingsMenu(context);
                    },
                  ),
                ),
              ],
            ],
          ),
          if (widget.isJoined) ...[
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTab(
                        'Dòng thời gian', Colors.orange, Colors.grey[100]!),
                    const SizedBox(width: 16),
                    _buildTab('Hoạt động mới nhất', Colors.black38,
                        Colors.grey[100]!),
                    const SizedBox(width: 16),
                    _buildTab('Biểu quyết', Colors.black38, Colors.grey[100]!),
                  ],
                ),
              ),
            )
          ],
        ],
      ),
    );
  }

  Widget _buildTab(String text, Color color, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
