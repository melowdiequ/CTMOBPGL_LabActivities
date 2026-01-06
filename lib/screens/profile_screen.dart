import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_font.dart';
import 'package:bermudez_mobileprog/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
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
                /// 🔹 Cover Photo
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/gege.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -50.h,
                  left: 20.w,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage:
                            const AssetImage('assets/images/jeje.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.grey,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.black,
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
                    text: 'Princess Glyza Bermudez',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      CustomFont(
                        text: '999',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        maxLines: 1,
                      ),
                      SizedBox(width: 6.w),
                      CustomFont(
                        text: 'followers',
                        fontSize: 15.sp,
                        color: Colors.grey,
                        maxLines: 1,
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.circle,
                        size: 5.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8.w),
                      CustomFont(
                        text: '150',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        maxLines: 1,
                      ),
                      SizedBox(width: 6.w),
                      CustomFont(
                        text: 'following',
                        fontSize: 15.sp,
                        color: Colors.grey,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CustomButton(
                        buttonName: 'Follow',
                        onPressed: () {},
                      ),
                      SizedBox(width: 10.w),
                      CustomButton(
                        buttonName: 'Message',
                        buttonType: 'outlined',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            /// 🔹 TABS
            TabBar(
              indicatorColor: FB_DARK_PRIMARY,
              tabs: [
                Tab(
                  child: CustomFont(
                    text: 'Posts',
                    fontSize: 15.sp,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  child: CustomFont(
                    text: 'About',
                    fontSize: 15.sp,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  child: CustomFont(
                    text: 'Photos',
                    fontSize: 15.sp,
                    color: Colors.black,
                    maxLines: 1,
                  ),
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  /// 🔹 POSTS TAB
                  ListView(
                    padding: EdgeInsets.all(10.w),
                    children: const [
                      PostCard(
                        userName: 'Princess Glyza Bermudez',
                        postContent: 'Enjoying learning Flutter 💙',
                        numOfLikes: 100,
                        date: 'Today',
                        profileImagePath: 'assets/images/jeje.jpg',
                        hasImage: false,
                      ),
                      PostCard(
                        userName: 'Princess Glyza Bermudez',
                        postContent:
                            'Profile screen successfully implemented!',
                        numOfLikes: 50,
                        date: 'Today',
                        profileImagePath: 'assets/images/jeje.jpg',
                        hasImage: true,
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
                          CustomFont(
                            text: 'About Me',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.black,
                            maxLines: 1,
                          ),
                          SizedBox(height: 10.h),
                          CustomFont(
                            text:
                                'Hi! I am Princess Glyza Bermudez, a second-year IT student. '
                                'I love coding, exploring new places, and creating mobile apps. '
                                'I enjoy learning Flutter and building apps for fun.',
                            fontSize: 14.sp,
                            color: Colors.black,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 🔹 PHOTOS TAB
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/gege.jpg'),
                              fit: BoxFit.cover,
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

/// 🔹 CUSTOM BUTTON
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
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: outlineColor),
        ),
        child: CustomFont(
          text: buttonName,
          fontSize: 12.sp,
          color: fontColor,
          maxLines: 1,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: CustomFont(
          text: buttonName,
          fontSize: 12.sp,
          color: fontColor,
          maxLines: 1,
        ),
      );
    }
  }
}
