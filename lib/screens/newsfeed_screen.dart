import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import 'detail_screen.dart'; // make sure this path is correct

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample posts
    final posts = [
      {
        'userName': 'Jellian',
        'postContent': 'Miss ko na si Gly hngggg T__T',
        'numOfLikes': 100,
        'date': 'October 11',
        'profileImagePath': 'assets/images/jeje.jpg',
        'hasImage': false,
        'imageUrl': '', // no post image
      },
      {
        'userName': 'Glyza Bermudez',
        'postContent': 'My baby is a cutiepie',
        'numOfLikes': 200,
        'date': 'December 2',
        'profileImagePath': 'assets/images/gege.jpg',
        'hasImage': true,
        'imageUrl': 'assets/images/gege.jpg', // example post image
      },
      {
        'userName': 'Aisle Nacpil',
        'postContent': 'Watched Bini yesterday ! <3',
        'numOfLikes': 200,
        'date': 'December 2',
        'profileImagePath': 'assets/images/gege.jpg',
        'hasImage': false,
        'imageUrl': '',
      },
      // Add the rest of your posts here...
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            // Navigate to DetailScreen when tapped
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
          child: PostCard(
            userName: post['userName'] as String,
            postContent: post['postContent'] as String,
            numOfLikes: post['numOfLikes'] as int,
            date: post['date'] as String,
            profileImagePath: post['profileImagePath'] as String,
            hasImage: post['hasImage'] as bool,
          ),
        );
      },
    );
  }
}
