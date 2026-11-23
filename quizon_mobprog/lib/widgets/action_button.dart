import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed ?? () {},
      icon: Icon(icon, color: Colors.grey.shade700),
      label: CustomText(
        text: label,
        fontSize: 13.sp,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        minimumSize: Size(0, 40.h),
      ),
    );
  }
}

class LikeActionButton extends StatelessWidget {
  const LikeActionButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.thumb_up_outlined,
      label: 'Like',
      onPressed: onPressed,
    );
  }
}

class CommentActionButton extends StatelessWidget {
  const CommentActionButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.chat_bubble_outline,
      label: 'Comment',
      onPressed: onPressed,
    );
  }
}
