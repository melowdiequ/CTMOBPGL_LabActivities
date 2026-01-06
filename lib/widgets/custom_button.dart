import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_font.dart';
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
            /// HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200.h,
                  color: Colors.grey[300],
                ),
                Positioned(
                  bottom: -50.h,
                  left: ScreenUtil().setWidth(20),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
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

            SizedBox(height: ScreenUtil().setHeight(60)),

            /// PROFILE INFO
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: 'Cyrus Rj Robles',
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.black,
                    maxLines: 1, 
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Row(
                    children: [
                      CustomFont(
                        text: '1M',
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        maxLines: 1, 
                      ),
                      SizedBox(width: ScreenUtil().setWidth(6)),
                      CustomFont(
                        text: 'followers',
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.grey,
                        maxLines: 1, 
                      ),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      Icon(
                        Icons.circle,
                        size: ScreenUtil().setSp(5),
                        color: Colors.grey,
                      ),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      CustomFont(
                        text: '1',
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        maxLines: 1, 
                      ),
                      SizedBox(width: ScreenUtil().setWidth(6)),
                      CustomFont(
                        text: 'following',
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.grey,
                        maxLines: 1, 
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Row(
                    children: [
                      CustomButton(
                        buttonName: 'Follow',
                        onPressed: () {},
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
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

            SizedBox(height: ScreenUtil().setHeight(10)),

            /// TAB BAR
            TabBar(
              indicatorColor: FB_DARK_PRIMARY,
              tabs: [
                Tab(
                  child: CustomFont(
                    text: 'Posts',
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    maxLines: 1, 
                  ),
                ),
                Tab(
                  child: CustomFont(
                    text: 'About',
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    maxLines: 1, 
                  ),
                ),
                Tab(
                  child: CustomFont(
                    text: 'Photos',
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    maxLines: 1, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 CUSTOM BUTTON
class CustomButton extends StatelessWidget {
  final String buttonName;
  final String buttonType;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.buttonType = 'elevated',
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == 'outlined') {
      return OutlinedButton(
        onPressed: onPressed,
        child: CustomFont(
          text: buttonName,
          fontSize: ScreenUtil().setSp(12),
          color: Colors.black,
          maxLines: 1, 
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: CustomFont(
        text: buttonName,
        fontSize: ScreenUtil().setSp(12),
        color: Colors.white,
        maxLines: 1, 
      ),
    );
  }
}
