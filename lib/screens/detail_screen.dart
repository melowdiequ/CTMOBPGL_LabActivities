import 'package:bermudez_mobileprog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
 
class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;
 
  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });
 
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
 
class _DetailScreenState extends State<DetailScreen> {
  late int _currentLikes;
  bool _isLiked = false;
 
  @override
  void initState() {
    super.initState();
    _currentLikes = widget.numOfLikes;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomFont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: Colors.black,
          maxLines: 1, 
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (widget.imageUrl == '')
                  ? SizedBox(height: ScreenUtil().setHeight(0))
                  : Image.asset(widget.imageUrl),
 
              SizedBox(height: ScreenUtil().setHeight(20)),
 
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.profileImageUrl == '')
                        ? const Icon(Icons.person)
                        : CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            backgroundImage: AssetImage(widget.profileImageUrl),
                          ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          maxLines: 1, 
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomFont(
                              text: widget.date,
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                              maxLines: 1, 
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: ScreenUtil().setSp(18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
 
              SizedBox(height: ScreenUtil().setHeight(15)),
 
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black,
                  maxLines: 10, 
                ),
              ),
 
              SizedBox(height: ScreenUtil().setHeight(30)),
              Divider(),
 
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _currentLikes++;
                          _isLiked = true;
                        });
                        print('Liked! New count: $_currentLikes');
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        color: _isLiked ? FB_TEXT_COLOR_WHITE : FB_DARK_PRIMARY,
                      ),
                      label: CustomFont(
                        text: (_currentLikes == 0) ? 'Like' : _currentLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: _isLiked ? FB_TEXT_COLOR_WHITE : FB_DARK_PRIMARY,
                        maxLines: 1, 
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                      label: CustomFont(
                        text: 'Comment',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                        maxLines: 1, 
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY),
                      label: CustomFont(
                        text: 'Share',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                        maxLines: 1, 
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
