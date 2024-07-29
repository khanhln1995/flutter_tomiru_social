import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/customButton.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Widget _buildSegment(int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: LinearProgressIndicator(
          value: _currentPage == index ? 1 : 0,
          minHeight: 5,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            // Handle back button
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle close button
            },
            child: Text(
              'Đóng',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              children: [
                _buildSegment(0),
                _buildSegment(1),
                _buildSegment(2),
                _buildSegment(3),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                StepOne(nextPage: _nextPage),
                AddCoverImage(nextPage: _nextPage),
                AddDescriptionScreen(nextPage:_nextPage),
                CreateArticles(
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  final VoidCallback nextPage;

  StepOne({required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Step 1: Add Cover Image', style: TextStyle(fontSize: 18)),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: nextPage,
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddCoverImage extends StatelessWidget {
  final VoidCallback nextPage;

  AddCoverImage({required this.nextPage});

  final List<String> imageUrls = [
    'assets/images/Rectangle 146046.png',
    'assets/images/Rectangle 146047.png',
    'assets/images/Rectangle 146048.png',
    'assets/images/Rectangle 146049.png',
    'assets/images/Rectangle 146050.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            'Thêm ảnh bìa',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Thêm hình ảnh giới thiệu về nhóm của bạn để thu hút sự chú ý.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Container(
                height: 148,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle 146045.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Chỉnh sửa',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            height: 69,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 69,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imageUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Center(
            child: CustomButton(
              content: "Xong",
              action: nextPage,
              isEnabled: true,
              backgroundColor: Colors.blue,
              height: 48,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddDescriptionScreen extends StatelessWidget {
  final VoidCallback nextPage;
  AddDescriptionScreen({required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thêm mô tả',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Hãy mô tả nhóm của bạn để mọi người biết nhóm xoay quanh chủ đề gì.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'Hãy miêu tả nhóm của bạn...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                )
              ),
              maxLines: 10,
            ),
            Spacer(),
            Center(
              child:  CustomButton(
              content: "Xong",
              action: nextPage,
              isEnabled: true,
              backgroundColor: Colors.blue,
              height: 48,
              width: MediaQuery.of(context).size.width,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_image.jpg'), // Thay bằng đường dẫn thực tế
                            radius: 20,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tony Nguyen',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Thành viên của nhóm Tomiru',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Hãy viết gì đó...',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Khoảng cách giữa border và button
            CustomButton(
              content: "Xong",
              action: (){},
              isEnabled: true,
              backgroundColor: Colors.blue,
              height: 48,
              width: MediaQuery.of(context).size.width - 32,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}