import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'action_button.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String imagePath; // Enhancement 1
  final String? avatarPath; // Enhancement 2

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imagePath = '',
    this.avatarPath,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int _likeCount;

  @override
  void initState() {
    super.initState();
    _likeCount = widget.numOfLikes;
  }

  @override
  void didUpdateWidget(covariant NewsFeedCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numOfLikes != widget.numOfLikes) {
      _likeCount = widget.numOfLikes;
    }
  }

  void _incrementLikeCount() {
    setState(() {
      _likeCount++;
    });
  }

  // Enhancement 2: avatar, uses the picture if given, person icon if not
  Widget _buildAvatar(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[300],
      child: widget.avatarPath == null
          ? Icon(Icons.person, size: radius, color: Colors.black54)
          : ClipOval(
              child: Image.asset(
                widget.avatarPath!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    Icon(Icons.person, size: radius, color: Colors.black54),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.w),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(18.r),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: widget.date,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 3.w),
                          Icon(Icons.public, color: Colors.grey, size: 15.r),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, size: 20.r),
              ],
            ),
            SizedBox(height: 8.h),
            // Post Content
            CustomText(
              text: widget.postContent,
              fontSize: 14.sp,
              color: Colors.black,
            ),
            SizedBox(height: 8.h),
            // Enhancement 1: image only shows if hasImage is true
            if (widget.hasImage)
              SizedBox(
                width: double.infinity,
                height: 360.h,
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => ColoredBox(
                    color: Colors.grey.shade200,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 36.r,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 8.h),
            // Number of likes
            Row(
              children: [
                Icon(Icons.thumb_up, color: FB_PRIMARY, size: 14.r),
                SizedBox(width: 5.w),
                CustomText(
                  text: _likeCount.toString(),
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            Divider(height: 16.h),
            // Enhancement 3: widget-based buttons
            Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 4.w,
              runSpacing: 4.h,
              children: [
                LikeActionButton(onPressed: _incrementLikeCount),
                CommentActionButton(onPressed: () {}),
                ActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            Divider(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: 'Most relevant',
                    fontSize: 13.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                _buildAvatar(12.r),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Write a comment...',
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          size: 18.r,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.photo_camera_outlined,
                          size: 18.r,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.gif_box_outlined,
                          size: 18.r,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.sticky_note_2_outlined,
                          size: 18.r,
                          color: Colors.grey,
                        ),
                      ],
                    ),
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
