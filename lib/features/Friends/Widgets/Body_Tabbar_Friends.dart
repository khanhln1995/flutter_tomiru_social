import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BodyTabBarFriend extends StatelessWidget {
  late List listName;
  late String avatarImage;
  late String friendName;
  late String mutualFriends;
  late Widget topOfTheList;
  late Widget buttonInTheList;

  BodyTabBarFriend({
    Key? key,
    required this.listName,
    required this.avatarImage,
    required this.friendName,
    required this.mutualFriends,
    required this.topOfTheList,
    required this.buttonInTheList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.14;
    double height = MediaQuery.of(context).size.height;
    double paddingListView = MediaQuery.of(context).size.width * 0.02;
    double paddingTopListView = MediaQuery.of(context).size.width * 0.065;
    double margin = MediaQuery.of(context).size.width * 0.027;
    double heightListTile = MediaQuery.of(context).size.height * 0.12;
    double fontSize = MediaQuery.of(context).size.width * 0.041;
    double heightTitle = MediaQuery.of(context).size.height * 0.022;
    double heightSubTitle = MediaQuery.of(context).size.height * 0.015;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: topOfTheList),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                return (listName[i][avatarImage] != null &&
                        listName[i][friendName] != null &&
                        listName[i][mutualFriends] != null)
                    ? Column(children: [
                        Container(
                          alignment: Alignment.center,
                          height: heightListTile,
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.asset(
                                listName[i][avatarImage],
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              listName[i][friendName],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                            ),
                            subtitle: Text(listName[i][mutualFriends]),
                            trailing: buttonInTheList,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: margin),
                          width: double.infinity,
                          height: 1.3,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 241, 241),
                          ),
                        )
                      ])
                    : Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[100]!,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            height: heightListTile,
                            child: ListTile(
                              leading: Container(
                                width: imageSize,
                                height: imageSize,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Container(
                                height: heightTitle,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                ),
                              ),
                              subtitle: Container(
                                height: heightSubTitle,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                ),
                              ),
                              trailing: buttonInTheList,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: margin),
                            width: double.infinity,
                            height: 1.3,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 243, 241, 241),
                            ),
                          )
                        ]),
                      );
              },
              childCount: listName == null ? 0 : listName.length,
            ),
          ),
        ],
      ),
    );
  }
}
