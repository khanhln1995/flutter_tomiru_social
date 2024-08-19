import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tomiru_social_flutter/features/group/Screens/group_option.dart';

class ChatGroupScreen extends StatefulWidget {
  final bool isAdmin;
  const ChatGroupScreen({super.key, required this.isAdmin});

  @override
  State<ChatGroupScreen> createState() => _ChatGroupScreenState();
}

class _ChatGroupScreenState extends State<ChatGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isAdmin: widget.isAdmin),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              children: const [
                ChatBubble(
                  isMe: false,
                  text: 'Xin chào bạn!',
                  avatar: 'assets/images/Ellipse 15.png',
                ),
                ChatBubble(
                  isMe: false,
                  text: 'Rất vui được gặp bạn!\nMình là môi giới bên Cenhomes',
                  avatar: 'assets/images/Ellipse 15.png',
                ),
                ChatBubble(
                  isMe: true,
                  text: 'Xin chào bạn!',
                ),
                ChatBubble(
                  isMe: false,
                  text: 'Xin chào bạn!',
                  avatar: 'assets/images/Ellipse 15.png',
                ),
                ChatBubble(
                  isMe: false,
                  text: 'Rất vui được gặp bạn!\nMình là môi giới bên Cenhomes',
                  avatar: 'assets/images/Ellipse 15.png',
                ),
                ChatBubble(
                  isMe: true,
                  text: 'Xin chào bạn!',
                ),
              ],
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isAdmin;

  const CustomAppBar({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => GroupOption(
                isAdmin: isAdmin,
              ),
              transitionDuration: const Duration(seconds: 0),
            ),
          );
        },
        child: Row(
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Ellipse 15.png'),
                      radius: 12,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Ellipse 15.png'),
                      radius: 12,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Ellipse 15.png'),
                      radius: 12,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Ellipse 15.png'),
                      radius: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nhóm BĐS',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Đang hoạt động',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.phone,
            color: Colors.blue,
            size: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.video,
            color: Colors.blue,
            size: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final String? avatar;

  const ChatBubble({
    super.key,
    required this.isMe,
    required this.text,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isMe) ...[
              CircleAvatar(
                backgroundImage:
                    AssetImage(avatar ?? 'assets/images/Ellipse 15.png'),
              ),
              const SizedBox(width: 8),
            ],
            Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(
                maxWidth: 170,
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x00f4f8fb),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.cameraRetro,
                color: Colors.blue, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.image,
                color: Colors.blue, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.microphoneLines,
                color: Colors.blue, size: 24),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập tin nhắn',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
