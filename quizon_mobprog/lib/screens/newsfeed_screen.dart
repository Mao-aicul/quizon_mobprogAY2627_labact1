import 'package:flutter/material.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 12),
          children: const [
            NewsFeedCard(
              userName: 'Cianne Dominguez',
              postContent: 'Hello, Outside World!',
              numOfLikes: 255,
              date: 'November 21',
              avatarPath: 'assets/images/cianne.jpg',
            ),
            NewsFeedCard(
              userName: 'International State College of the Philippines',
              postContent: 'Enroll Now!',
              numOfLikes: 999,
              hasImage: true,
              imagePath: 'assets/images/post1.jpg',
              date: 'November 22',
              avatarPath: 'assets/images/iscp.png',
            ),
            NewsFeedCard(
              userName: 'Philippines News',
              postContent: 'PBBM, NAGING EMOSYONAL DAHIL SA NANGYAYARING KORAPSYON SA BANSA',
              numOfLikes: 67,
              avatarPath: 'assets/images/phnews.webp',
              hasImage: true,
              imagePath: 'assets/images/post2.jpg',
              date: 'November 23',
            ),
          ],
        ),
      ),
    );
  }
}
