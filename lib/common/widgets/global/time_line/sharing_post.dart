import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SharePostSheet extends StatefulWidget {
  const SharePostSheet({super.key});
  @override
  State<SharePostSheet> createState() => _SharePostSheetState();
}

class _SharePostSheetState extends State<SharePostSheet> {
  final List<String> items = ['Công khai', 'Chỉ mình tôi'];
  String? _selectedValue = 'Công khai';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            Row(children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/kem.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Trang Nguen',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                    customButton: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.public, size: 16),
                          SizedBox(width: 4),
                          Text('Công khai'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                          child: Text('Công khai'), value: 'public'),
                      DropdownMenuItem(child: Text('Bạn bè'), value: 'friends'),
                      DropdownMenuItem(
                          child: Text('Chỉ mình tôi'), value: 'private'),
                    ],
                    onChanged: (value) {},
                  ))
                ],
              )
            ]),
            const SizedBox(height: 8.0),
            TextField(
              controller: _controller,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              // focusNode: fieldFocus,
              decoration: InputDecoration(
                hintText: 'Hãy nói gì về nội dung này..',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
              maxLines: null,
              minLines: 3,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('Chia sẻ ngay',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Chia sẻ lên tin của bạn'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Gửi bằng tin nhắn'),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Chia sẻ lên nhóm'),
            ),
          ],
        ),
      );
    });
  }
}
