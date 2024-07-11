import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Add_Cover_Image_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/member.dart';

class InviteMembersScreen extends StatefulWidget {
  const InviteMembersScreen({super.key});

  @override
  State<InviteMembersScreen> createState() => _InviteMembersScreenState();
}

class Member {
  final String name;
  final String avatar;
  const Member({required this.name, required this.avatar});
}

class _InviteMembersScreenState extends State<InviteMembersScreen> {
  final List<Member> members = [
    Member(name: 'Anh Cường', avatar: 'assets/images/Ellipse 10.png'),
    Member(name: 'Phạm Đình Chương', avatar: 'assets/images/Ellipse 10 (1).png'),
    Member(name: 'Bình Cenhomes', avatar: 'assets/images/Ellipse 10 (2).png'),
    Member(name: 'Lan Anh Cường', avatar: 'assets/images/Ellipse 10 (3).png'),
    Member(name: 'Mạnh Cường', avatar: 'assets/images/Ellipse 10 (4).png'),
    Member(name: 'Bình Cenhomes', avatar: 'assets/images/Ellipse 11.png'),
    Member(name: 'Lan Anh Cường', avatar: 'assets/images/Ellipse 12.png'),
  ];

  // Tạo một danh sách để theo dõi trạng thái của các thành viên đã được mời
  final List<bool> invited = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Mời thành viên',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MultiStepForm()));
          }, 
          child: 
          Text(
            'Tiếp',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            )
          )
          )
        ]
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(side: BorderSide.none),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.grey[100],
                    ),
                    child: Image.asset("assets/images/Group.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Chia sẻ nhóm",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Gợi ý",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: members.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      onTap: () {},
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(members[index].avatar),
                      ),
                      title: Text(
                        members[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.grey[100],
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            invited[index] = true;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(invited[index]? Icons.check: Icons.add, size: 18),
                            SizedBox(width: 4),
                            Text(
                             invited[index]? 'Đã mời': 'Mời',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: invited[index]? Colors.black: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      indent: 80, // Indent to align with the avatar
                      endIndent: 10, // End indent to leave space before the trailing button
                      color: Colors.grey[200],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
