import 'package:bermudez_mobileprog/constants.dart';
import 'package:bermudez_mobileprog/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detail_screen.dart'; 

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample posts data
    final posts = [
      {
        'userName': 'Jellian',
        'postContent': 'Miss ko na si Gly hngggg T__T',
        'numOfLikes': 100,
        'date': 'October 11',
        'profileImagePath': 'assets/images/jeje.jpg',
        'hasImage': false,
        'imageUrl': '',
      },
      {
        'userName': 'Glyza Bermudez',
        'postContent': 'My baby is a cutiepie',
        'numOfLikes': 200,
        'date': 'December 2',
        'profileImagePath': 'assets/images/gege.jpg',
        'hasImage': true,
        'imageUrl': 'assets/images/gege.jpg',
      },
      {
        'userName': 'Aisle Nacpil',
        'postContent': 'Watched Bini yesterday ! <3',
        'numOfLikes': 200,
        'date': 'December 2',
        'profileImagePath': 'assets/images/gege.jpg', // Using placeholder
        'hasImage': false,
        'imageUrl': '',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(10.w),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];

        // Using our local interactive FeedPost widget
        return FeedPost(
          userName: post['userName'] as String,
          postContent: post['postContent'] as String,
          date: post['date'] as String,
          initialLikes: post['numOfLikes'] as int,
          profileImagePath: post['profileImagePath'] as String,
          hasImage: post['hasImage'] as bool,
          postImageUrl: post['imageUrl'] as String,
          onCardTap: () {
            // Navigate to DetailScreen ONLY when body is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  userName: post['userName'] as String,
                  postContent: post['postContent'] as String,
                  numOfLikes: post['numOfLikes'] as int,
                  date: post['date'] as String,
                  profileImageUrl: post['profileImagePath'] as String,
                  imageUrl: post['imageUrl'] as String,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// 🔻 LOCAL INTERACTIVE FEED POST WIDGET
// ---------------------------------------------------------------------------

class FeedPost extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int initialLikes;
  final String profileImagePath;
  final bool hasImage;
  final String postImageUrl;
  final VoidCallback onCardTap; 

  const FeedPost({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    required this.initialLikes,
    required this.profileImagePath,
    this.hasImage = false,
    this.postImageUrl = '',
    required this.onCardTap,
  });

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  late int likes;
  bool isLiked = false;
  bool showCommentField = false; // To toggle comment section
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w), // Added padding for better look
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 1. CLICKABLE BODY (Navigates to Detail)
          GestureDetector(
            onTap: widget.onCardTap,
            child: Container(
              color: Colors.transparent, // Ensures clicks register on empty space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
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
                          CustomFont(
                            text: widget.userName, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 16.sp, 
                            color: Colors.black, 
                            maxLines: 1
                          ),
                          Row(
                            children: [
                              CustomFont(
                                text: widget.date, 
                                fontSize: 12.sp, 
                                color: Colors.grey, 
                                maxLines: 1
                              ),
                              SizedBox(width: 5.w),
                              Icon(Icons.public, size: 12.sp, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 10.h),
                  
                  // Post Content
                  CustomFont(
                    text: widget.postContent, 
                    fontSize: 14.sp, 
                    color: Colors.black, 
                    maxLines: 3
                  ),
                  
                  SizedBox(height: 10.h),
                  
                  // Optional Image
                  if (widget.hasImage && widget.postImageUrl.isNotEmpty)
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(widget.postImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 10.h),

          /// 2. ACTION BUTTONS (Independent)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Like Button
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    isLiked ? likes++ : likes--;
                  });
                },
                icon: Icon(Icons.thumb_up, color: isLiked ? FB_TEXT_COLOR_WHITE : FB_DARK_PRIMARY),
                label: Text(
                  likes == 0 ? 'Like' : '$likes',
                  style: TextStyle(color: isLiked ? FB_TEXT_COLOR_WHITE : FB_DARK_PRIMARY),
                ),
              ),
              
              // Comment Button (Toggles input field)
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showCommentField = !showCommentField;
                  });
                },
                icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY),
                label: const Text('Comment', style: TextStyle(color: FB_DARK_PRIMARY)),
              ),
              
              // Share Button
              TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Shared to your wall!"))
                  );
                },
                icon: const Icon(Icons.share, color: FB_DARK_PRIMARY),
                label: const Text('Share', style: TextStyle(color: FB_DARK_PRIMARY)),
              ),
            ],
          ),

          /// 3. COMMENT SECTION (Visible when Comment button is clicked)
          if (showCommentField)
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: FB_DARK_PRIMARY),
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        print("Commented: ${_commentController.text}");
                        _commentController.clear();
                        setState(() {
                          showCommentField = false; // Hide after sending
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Comment Posted!"))
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            
          const Divider(),
        ],
      ),
    );
  }
}