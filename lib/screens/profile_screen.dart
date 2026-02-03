import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bermudez_mobileprog/screens/detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userName; 

  const ProfileScreen({
    super.key, 
    required this.userName 
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  
  void _goToDetails(BuildContext context, {
    required String name,
    required String content,
    required String date,
    required int likes,
    String img = '',
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          userName: name,
          postContent: content,
          date: date,
          numOfLikes: likes,
          imageUrl: img,
          profileImageUrl: 'assets/images/jeje.jpg',
        ),
      ),
    );
  }

 
  void _openPhoto(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () => _openPhoto(context, 'assets/images/gege.jpg'), // Click Cover to view
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/gege.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50.h,
                  left: 20.w,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => _openPhoto(context, 'assets/images/jeje.jpg'), // Click Profile to view
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage: const AssetImage('assets/images/jeje.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => print("Camera Icon Clicked"),
                          child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Colors.grey,
                            child: const Icon(Icons.camera_alt, size: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 60.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: widget.userName, 
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CustomButton(
                        buttonName: 'Follow', 
                        onPressed: () => print("Followed")
                      ),
                      SizedBox(width: 10.w),
                      CustomButton(
                        buttonName: 'Message', 
                        buttonType: 'outlined', 
                        onPressed: () => print("Message clicked")
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

      
            TabBar(
              indicatorColor: FB_DARK_PRIMARY,
              tabs: [
                Tab(child: CustomFont(text: 'Posts', fontSize: 15.sp, color: Colors.black, maxLines: 1)),
                Tab(child: CustomFont(text: 'About', fontSize: 15.sp, color: Colors.black, maxLines: 1)),
                Tab(child: CustomFont(text: 'Photos', fontSize: 15.sp, color: Colors.black, maxLines: 1)),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
              
                  ListView(
                    padding: EdgeInsets.all(10.w),
                    children: [
                      FeedPost(
                        userName: widget.userName, 
                        postContent: 'Enjoying learning Flutter 💙',
                        date: 'Today',
                        initialLikes: 100,
                        profileImagePath: 'assets/images/jeje.jpg',
                        hasImage: false,
                        onCardTap: () => _goToDetails(
                          context, 
                          name: widget.userName, 
                          content: 'Enjoying learning Flutter 💙', 
                          date: 'Today', 
                          likes: 100
                        ),
                      ),
                      FeedPost(
                        userName: widget.userName, 
                        postContent: 'Profile screen implemented!',
                        date: 'Today',
                        initialLikes: 50,
                        profileImagePath: 'assets/images/jeje.jpg',
                        hasImage: true,
                        onCardTap: () => _goToDetails(
                          context, 
                          name: widget.userName, 
                          content: 'Profile screen implemented!', 
                          date: 'Today', 
                          likes: 50, 
                          img: 'assets/images/gege.jpg'
                        ),
                      ),
                    ],
                  ),

                  /// 🔹 ABOUT TAB
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(text: 'About Me', fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black, maxLines: 1),
                          SizedBox(height: 10.h),
                          CustomFont(
                            // 8. Dynamic Name in Bio
                            text: 'Hi! I am ${widget.userName}, a second-year IT student. I love coding, exploring new places, and creating mobile apps. I enjoy learning Flutter and building apps for fun.',
                            fontSize: 14.sp, color: Colors.black, maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // Opens the photo alone in full screen
                              _openPhoto(context, 'assets/images/gege.jpg');
                            },
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/gege.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonType;
  final String buttonName;
  final Color fontColor;
  final Color outlineColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.buttonType = 'elevated',
    required this.buttonName,
    this.fontColor = Colors.black,
    this.outlineColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType.toLowerCase() == 'outlined') {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(color: outlineColor),
        ),
        child: CustomFont(text: buttonName, fontSize: 12.sp, color: fontColor, maxLines: 1),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: CustomFont(text: buttonName, fontSize: 12.sp, color: fontColor, maxLines: 1),
      );
    }
  }
}

class FeedPost extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int initialLikes;
  final String profileImagePath;
  final bool hasImage;
  final VoidCallback onCardTap; 

  const FeedPost({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.initialLikes,
    required this.profileImagePath,
    this.hasImage = false,
    required this.onCardTap,
  });

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onCardTap,
            child: Container(
              color: Colors.transparent, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: AssetImage(widget.profileImagePath),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(text: widget.userName, fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.black, maxLines: 1),
                          Row(
                            children: [
                              CustomFont(text: widget.date, fontSize: 12.sp, color: Colors.grey, maxLines: 1),
                              SizedBox(width: 5.w),
                              Icon(Icons.public, size: 12.sp, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomFont(text: widget.postContent, fontSize: 14.sp, color: Colors.black, maxLines: 3),
                  SizedBox(height: 10.h),
                  if (widget.hasImage)
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/gege.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    isLiked ? likes++ : likes--;
                  });
                },
                icon: Icon(Icons.thumb_up, color: isLiked ? Colors.blue : FB_DARK_PRIMARY),
                label: Text(
                  likes == 0 ? 'Like' : '$likes',
                  style: TextStyle(color: isLiked ? Colors.blue : FB_DARK_PRIMARY),
                ),
              ),
              TextButton.icon(
                onPressed: () {}, 
                icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                label: const Text('Comment', style: TextStyle(color: FB_DARK_PRIMARY)),
              ),
              TextButton.icon(
                onPressed: () {}, 
                icon: const Icon(Icons.share, color: FB_DARK_PRIMARY),
                label: const Text('Share', style: TextStyle(color: FB_DARK_PRIMARY)),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}