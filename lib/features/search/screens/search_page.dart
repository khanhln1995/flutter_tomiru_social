import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/service_content.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController textcontroller = TextEditingController();
  final List<String> recentlyKeys = [
    'Cho Tomiru',
    'Tomxu',
    'Chuyen Tomxy',
    'Cho ket qua',
    'Sự kiện',
    'Vay mua nhà',
  ];

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  Widget _body() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textcontroller,
                        onChanged: (value) {
                          setState(() {});
                        },
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]!),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey[400]),
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Hủy',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              if (textcontroller.text.isEmpty) listKeyword(),
              const SizedBox(height: 12.0),
              if (textcontroller.text.isEmpty) popularService(),
              if (textcontroller.text.isNotEmpty) listVd(),
            ],
          ),
        )
      ],
    );
  }

  Widget listKeyword() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: const Text('Từ khóa phổ biến',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: List.generate(
                  recentlyKeys.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextButton(
                      onPressed: () {
                        textcontroller.text = recentlyKeys[index];
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          recentlyKeys[index],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget popularService() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dịch vụ phổ biến',
                style: TextStyle(color: Colors.grey[600], fontSize: 18)),
            const SizedBox(height: 10),
            ServiceContent(),
            const SizedBox(height: 10),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        mainTitle: 'Tìm kiếm',
      ),
      body: _body(),
    );
  }

  Widget listVd() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: const Text('Dành cho bạn',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3, // Replace with the actual count of items
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey, // Replace with actual image or avatar
                ),
                title: const Text(
                  'Chợ Tomiru lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(fontSize: 12),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
