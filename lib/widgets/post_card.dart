import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: CustomFont(
        text: label,
        fontSize: 12.sp,
        color: color,
        maxLines: 1,
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String profileImagePath;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.profileImagePath,
    this.numOfLikes = 0,
    this.hasImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.w),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  backgroundImage: AssetImage(profileImagePath),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: userName,
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        CustomFont(
                          text: date,
                          fontSize: 12.sp,
                          color: Colors.grey,
                          maxLines: 1,
                        ),
                        SizedBox(width: 3.w),
                        Icon(
                          Icons.public,
                          size: 15.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: 5.h),

            CustomFont(
              text: postContent,
              fontSize: 12.sp,
              color: Colors.black,
              maxLines: 5,
            ),

            SizedBox(height: 5.h),

            hasImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      'assets/images/dem.jpg',
                      width: double.infinity,
                      height: 200.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox.shrink(),

            SizedBox(height: 5.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                  icon: Icons.thumb_up,
                  label: '$numOfLikes',
                  color: FB_DARK_PRIMARY,
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.comment,
                  label: 'Comment',
                  color: FB_DARK_PRIMARY,
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  color: FB_DARK_PRIMARY,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 5.h),

            Row(
              children: [
                CircleAvatar(
                  radius: 8.sp,
                  backgroundImage: AssetImage(profileImagePath),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    height: 25.h,
                    padding: EdgeInsets.only(left: 10.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: CustomFont(
                      text: 'Write a comment...',
                      fontSize: 11.sp,
                      color: Colors.grey,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            CustomFont(
              text: 'View comments',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
