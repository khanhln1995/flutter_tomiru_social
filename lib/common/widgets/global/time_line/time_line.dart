import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/buildAvatarWidget.dart';
// import 'package:tomiru_social_flutter/common/widgets/global/time_line/show_detail_images/post.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/user_input_avatar_field.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/like_bar.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';
import 'package:tomiru_social_flutter/util/show_post_comments.dart';
// import "../../../features/Profile-social/Screens/Profile_Screen.dart";
import "package:tomiru_social_flutter/features/Profile-social/Screens/Profile_Screen.dart";
import "show_detail_images/image_gallery_screen.dart";
import 'package:tomiru_social_flutter/common/widgets/global/time_line/bar_under_cmt.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//time line dùng ở các vị trí khác nhau như ở trang chủ , bạn bè , nhóm ...
//sẽ có khác nhau ở tham số truyền vào để check xem người dùng đang ở page nào để call API
class TimeLine extends StatefulWidget {
  final ScrollController scrollController;
  final List<Tweet> demoData;
  final List<Author> userData;
  final bool isLoading;

  const TimeLine({
    super.key,
    required this.scrollController,
    required this.demoData,
    required this.userData,
    required this.isLoading,
  });

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == widget.demoData.length) {
            return _buildLoadingIndicator();
          }
          final tweet = widget.demoData[index];
          final author =
              widget.userData.isNotEmpty ? widget.userData[index] : null;
          return Column(
            children: [
              SizedBox(height: 8.0),
              if (author != null) ...[
                _buildFeedCard(context, tweet, author),
              ],
            ],
          );
        },
        childCount: widget.isLoading
            ? widget.demoData.length + 1
            : widget.demoData.length,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return widget.isLoading
        ? const Center(child: CircularProgressIndicator())
        : const SizedBox.shrink();
  }

  Widget _buildFeedCard(BuildContext context, Tweet data, Author userData) {
// Giả sử bạn đã lấy thời gian từ file JSON và gán cho biến createdAtString
    String createdAtString = data.createdAt.toString();

// Chuyển đổi chuỗi thời gian thành đối tượng DateTime
    DateTime createdAtDateTime = DateTime.parse(createdAtString);
    // Lấy thời gian hiện tại
    DateTime now = DateTime.now();

// Tính thời gian đã trôi qua từ thời điểm tạo bài viết đến thời điểm hiện tại
    Duration difference = now.difference(createdAtDateTime);
    String timeAgoString(Duration difference) {
      if (difference.inDays >= 2) {
        return '${difference.inDays} ngày trước';
      } else if (difference.inDays >= 1) {
        return 'hôm qua';
      } else {
        return '${difference.inHours} giờ ${difference.inMinutes.remainder(60)} phút trước';
      }
    }

    return Column(
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: BuildAvatarWidget(urlAvatar: userData.avatar),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  child: Text(userData.username.toString()),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileScreen(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 10),
                                Image.asset('assets/images/crown.png'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ke thủ - ${timeAgoString(difference)}',
                                  style: const TextStyle(
                                    color: Color(0xff6E7191),
                                    fontSize: 12,
                                  ),
                                ),
                                const Icon(
                                  Icons.language,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Theo dõi',
                              style: TextStyle(
                                color: Color(0xffF6891F),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 25,
                              color: Color(0xff6E7191),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildContent(data.text),
                  // Kiểm tra xem data.images có dữ liệu không
                  if (data.images.isNotEmpty) ...[
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 250,
                        child: _buildImages(data.images),
                      ),
                    ),
                  ],
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[50], // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Gửi tin nhắn',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  LikeBar(
                    likeCount: data.likesCount,
                    shareCount: data.retweetsCount,
                    commentCount: data.repliesCount,
                    tweetId: data.id,
                    isTweetLiked: data.isTweetLiked,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 1,
                      color: const Color(0xFFDDDEE6),
                    ),
                  ),
                  _buildComment(context, data, userData),
                  const SizedBox(height: 10),
                  _buildYourComment(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildComment(BuildContext context, Tweet data, Author userData) {
    if (data.repliesCount == 0) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('click');
                },
                child: const Row(
                  children: [
                    Text(
                      'Phù hợp nhất',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down_outlined),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showUnderBottomSheet(context, 0, data.id);
                },
                child: const Text(
                  'Xem thêm bình luận',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildAvatarWidget(
                urlAvatar: userData.avatar,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 10),
              data.repliesCount > 50
                  ? Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: const Color(0xffECECEC),
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    userData.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    data.repliesCount.toString(),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CommentBar(likes: data.likesCount, time: '5 giờ')
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0xffECECEC),
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  userData.username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  data.repliesCount.toString(),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CommentBar(likes: data.likesCount, time: '5 giờ')
                      ],
                    ),
              const Expanded(
                flex: 1,
                child: SizedBox(width: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYourComment() {
    return const UserInputAvatarField(
        urlAvatar: 'assets/images/mark-zuckerberg.jpg');
  }

  Widget _buildContent(String content) {
    bool isLongText = content.length > 180;
    bool showFullText = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showFullText || !isLongText
                  ? content
                  : "${content.substring(0, 180)}...",
              style: const TextStyle(fontSize: 14),
            ),
            if (isLongText)
              GestureDetector(
                onTap: () {
                  setState(() {
                    showFullText = !showFullText;
                  });
                },
                child: Text(
                  showFullText ? "Thu gọn" : "Xem thêm",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  /// check box image case 1/2/4/ >4
  Widget _buildImages(List<ImageItem> images) {
    if (images.isEmpty) {
      return Container();
    } else if (images.length == 1) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageGalleryScreen(
                images: images.map((image) => image.src).toList(),
                initialIndex: 0,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl:
                images[0].src, // Accessing the `src` property of ImageItem
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      );
    } else if (images.length == 2) {
      return Row(
        children: images.asMap().entries.map((entry) {
          int index = entry.key;
          String imageUrl =
              entry.value.src; // Accessing the `src` property of ImageItem
          return Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGalleryScreen(
                      images: images.map((image) => image.src).toList(),
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    } else if (images.length == 4) {
      return Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: images.sublist(0, 2).asMap().entries.map((entry) {
                int index = entry.key;
                String imageUrl = entry
                    .value.src; // Accessing the `src` property of ImageItem
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            images: images.map((image) => image.src).toList(),
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: images.sublist(2).asMap().entries.map((entry) {
                int index = entry.key + 2;
                String imageUrl = entry
                    .value.src; // Accessing the `src` property of ImageItem
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            images: images.map((image) => image.src).toList(),
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    } else if (images.length >= 5) {
      return Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGalleryScreen(
                      images: images.map((image) => image.src).toList(),
                      initialIndex: 0,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: images[0]
                        .src, // Accessing the `src` property of ImageItem
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            images: images.map((image) => image.src).toList(),
                            initialIndex: 1,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: images[1]
                              .src, // Accessing the `src` property of ImageItem
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            images: images.map((image) => image.src).toList(),
                            initialIndex: 2,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: images[2]
                              .src, // Accessing the `src` property of ImageItem
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                if (images.length > 4)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageGalleryScreen(
                              images: images.map((image) => image.src).toList(),
                              initialIndex: 4,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: images[4]
                                    .src, // Accessing the `src` property of ImageItem
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    '+${images.length - 4}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    } else {
      // case = 3
      return Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGalleryScreen(
                      images: images.map((image) => image.src).toList(),
                      initialIndex: 0,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: images[0]
                        .src, // Accessing the `src` property of ImageItem
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: images.sublist(1).asMap().entries.map((entry) {
                int index = entry.key + 1;
                String imageUrl = entry
                    .value.src; // Accessing the `src` property of ImageItem
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageGalleryScreen(
                            images: images.map((image) => image.src).toList(),
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }
  }
}
