import 'package:flutter/material.dart';
import '../widgets/custom_info.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 8),
      children: const [
        CustomInformation(
          name: 'Jellian',
          post: 'posted a new update',
          description: 'Miss ko na si Gly hngggg T__T',
          date: 'October 11',
          profileImagePath: 'assets/images/jeje.jpg',
        ),
        CustomInformation(
          name: 'Glyza Bermudez',
          post: 'posted a new update',
          description: 'My baby is a cutiepie',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Aisle Nacpil',
          post: 'posted a new update',
          description: 'Watched Bini yesterday ! <3',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Denese Manuel',
          post: 'posted a new update',
          description: 'Miss ko na si Nicole',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Ronald Seña',
          post: 'posted a new update',
          description: 'Di ako pinansin ng loviedabs ko',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Marygail Cesar',
          post: 'posted a new update',
          description: 'I love love love brat album',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Len Alegre',
          post: 'posted a new update',
          description: 'Nakakainis naman di nagana code ko',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
        CustomInformation(
          name: 'Sophia Ahorro',
          post: 'posted a new update',
          description: 'Ayoko pumasok',
          date: 'December 2',
          profileImagePath: 'assets/images/gege.jpg',
        ),
      ],
    );
  }
}
