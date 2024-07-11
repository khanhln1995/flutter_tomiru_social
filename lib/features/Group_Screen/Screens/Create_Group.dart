import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Chat_Group_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Invite_Members_Screen.dart';
import 'package:tomiru_social_flutter/features/Signin_Screen/Widgets/custom_text_field.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  String _privacy = 'Chọn quyền riêng tư';
  void _showPrivacyOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250.0,
          padding: EdgeInsets.all(16.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 27,
                ),
              ),
              title: const Text('Chọn quyên riêng tư',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(6.0),
                child: Container(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.public),
                  title: Text('Công khai',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  subtitle: Text('Mọi người trên hoặc ngoài Salebook',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      )),
                  trailing: Radio<String>(
                    value: 'Công khai',
                    groupValue: _privacy,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _privacy = value!;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _privacy = 'Công khai';
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Chỉ mình tôi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  subtitle: Text('Chỉ mình tôi được xem',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      )),
                  trailing: Radio<String>(
                    value: 'Chỉ mình tôi',
                    groupValue: _privacy,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _privacy = value!;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _privacy = 'Chỉ mình tôi';
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 27,
          ),
        ),
        title: const Text('Tạo nhóm',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tên",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                )),
            SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: 'Đặt tên nhóm',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Quyền riêng tư",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                )),
            SizedBox(height: 7),
            GestureDetector(
              onTap: () => _showPrivacyOptions(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                child: Text(_privacy,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context)=> const InviteMembersScreen())
                  );
                },
                child: Text('Tiếp tục',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
