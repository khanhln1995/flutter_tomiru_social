import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Friends/Widgets/Body_Bottom_Sheet_Sort.dart';
import 'package:tomiru_social_flutter/features/Friends/Widgets/Open_Bottom_Sheet.dart';
import 'package:tomiru_social_flutter/features/Notify_Screen/widgets/notify_bottom_sheet.dart';

class BodyNotifyScreen extends StatefulWidget {
  const BodyNotifyScreen({super.key});

  @override
  _BodyNotifyScreenState createState() => _BodyNotifyScreenState();
}

class _BodyNotifyScreenState extends State<BodyNotifyScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    const Tab(
      child: CustomTab(
        text: 'Tất cả',
        fontSize: 14,
      ),
    ),
    const Tab(
      child: CustomTab(
        text: 'TOMXU',
        fontSize: 14,
      ),
    ),
    const Tab(
      child: CustomTab(
        text: 'Tương tác',
        fontSize: 14,
      ),
    ),
    const Tab(
      child: CustomTab(
        text: 'Tài khoản',
        fontSize: 14,
      ),
    ),
  ];

  late AnimationController _animationController;
  bool _showNotification = false;
  String _notificationMessage = "";
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _showSuccessNotification() {
    setState(() {
      _notificationMessage = "Đã xóa thông báo";
      _showNotification = true;
    });
    _animationController.forward(from: 0.0);

    Future.delayed(Duration(seconds: 1), () {
      _animationController.reverse().then((_) {
        setState(() {
          _showNotification = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                TabBar(
                  tabs: _tabs.map((Tab tab) => tab).toList(),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  dividerColor: const Color.fromARGB(255, 215, 215, 215),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                leading: const SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/icon-tomiru-appbar.jpg'),
                                  ),
                                ),
                                title: const Text(
                                  'Tomiru đã chuyển đến bạn 1.000 Tomxu và lời nhắn của anh ấy',
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Text(
                                  "1 giờ trước",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]),
                                ),
                                trailing: GestureDetector(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => NotifyBottomSheet(
                                      onAction: _showSuccessNotification,
                                    ),
                                  ),
                                  child: Icon(Icons.more_horiz, size: 25),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child:  ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                leading: const SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/icon-tomiru-appbar.jpg'),
                                  ),
                                ),
                                title: const Text(
                                  'Tomiru đã chuyển đến bạn 1.000 Tomxu và lời nhắn của anh ấy',
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Text(
                                  "1 giờ trước",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500]),
                                ),
                                trailing: GestureDetector(
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    
                                    builder: (context) => NotifyBottomSheet(
                                      onAction: _showSuccessNotification,
                                    ),
                                  ),
                                  child: Icon(Icons.more_horiz, size: 25),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Tab 3 - ListTitle ${index + 1}'),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Tab 4 - ListTitle ${index + 1}'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           if (_showNotification)
              Positioned(
                top: 50, // Adjust this to your desired vertical position
                left: MediaQuery.of(context).size.width / 2 -
                    100, // Adjust 100 to half the width of your notification widget
                child: Container(
                  width:
                      200, // Adjust to the width of your TopNotification widget
                  child: TopNotification(
                    message: _notificationMessage,
                    animationController: _animationController,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomTab({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Content fits within available space
      children: [
        Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
        const SizedBox(width: 8.0), // Add some horizontal space
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(
            minWidth: 22.0,
            minHeight: 22.0,
          ),
          child: const Text(
            '3',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
