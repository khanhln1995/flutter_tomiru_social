import 'package:flutter/material.dart';


import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/member.dart';
import 'package:tomiru_social_flutter/helper/enum.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';




class Addmember extends StatefulWidget {
  const Addmember({Key? key}) : super(key: key);

  @override
  State<Addmember> createState() => _AddmemberState();
}

class _AddmemberState extends State<Addmember> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Member> addingMember = [];
  List<Member> members = [
    Member(
        id: 1,
        name: "CEN ThaiTV",
        role: MemberRole(userRole: UserRole.CUSTOMER), 
        lastSeen: "2 phút trước",
        imageUrl: 'assets/images/icon-tomiru.png',
        isOnline: true),
    Member(
        id: 2,
        name: "Bích Thùy",
        role: MemberRole(userRole: UserRole.INVESTOR),
        lastSeen: "",
        imageUrl: 'assets/images/member2.png',
        isOnline: false),
    Member(
        id: 3,
        name: "Ánh Nguyệt",
        role: MemberRole(userRole: UserRole.CUSTOMER),
        lastSeen: "14 phút trước",
        imageUrl: 'assets/images/member3.png',
        isOnline: true),
    Member(
        id: 4,
        name: "C Hoa S3",
        role: MemberRole(userRole: UserRole.CUSTOMER),
        lastSeen: "",
        imageUrl: 'assets/images/member4.png',
        isOnline: false),
    Member(
        id: 5,
        name: "Bnd",
        role: MemberRole(userRole: UserRole.CUSTOMER),
        lastSeen: "",
        imageUrl: 'assets/images/member5.png',
        isOnline: true),
    Member(
        id: 6,
        name: "Hồng Anh Vũ",
        role: MemberRole(userRole: UserRole.INVESTOR),
        lastSeen: "",
        imageUrl: 'assets/images/member6.png',
        isOnline: true),
    Member(
        id: 7,
        name: "CEN NguyenHuuKien",
        role: MemberRole(userRole: UserRole.SALER),
        lastSeen: "40 phút trước",
        imageUrl: 'assets/images/member7.png',
        isOnline: false),
    Member(
        id: 8,
        name: "Zombie",
        role: MemberRole(userRole: UserRole.CUSTOMER),
        lastSeen: "10 phút trước",
        imageUrl: 'assets/images/member9.png',
        isOnline: true),
  ];

  void chosenMember(int id) {
    setState(() {
      var member = members.firstWhere((e) => e.id == id);
      if (addingMember.contains(member)) {
        addingMember.remove(member);
      } else {
        addingMember.add(member);
      }
    });
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              hintText: 'Tìm tên',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Expanded(
          child: Container(
            color: Colors.grey[50],
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[100], // Màu của đường phân cách
                thickness: 1, // Độ dày của đường phân cách
              ),
              itemCount: members.length,
              itemBuilder: (context, index) {
                return MemberWidget(
                    member: members[index],
                    isAdding: true,
                    chosenMember: chosenMember,
                    addingMem: addingMember);
              },
            ),
          ),
        ),
        SizedBox(height: 4.0),
        _buildSelectedMembers(),
      ],
    );
  }

  Widget _buildSelectedMembers() {
    return addingMember.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Đã chọn ${addingMember.length} người bạn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  SizedBox(height: 20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Row(
                            children: addingMember.map((member) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(member.imageUrl),
                                      radius: 30,
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            addingMember.removeWhere((e)=>e.id == member.id);
                                          });
                                        },
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.black,
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          padding: EdgeInsets.all(16.0),
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.orange)),
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward,
                              color: Colors.white, size: 32.0),
                        )
                      ]),
                ],
              ),
            ))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        titleText: 'Thêm thành viên',
        onBackPress: () => Navigator.of(context).pop(),
        bgcolor: Colors.white,
        colors: Colors.black,
      ),
      body: _body(context),
    );
  }
}