import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary,width: 2.w),
        borderRadius: BorderRadius.circular(32.sp)
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 18,
        icon: Icon(icon),
        padding: EdgeInsets.all(4.sp),
        constraints: const BoxConstraints(),
        splashRadius: 24.r,

      ),
    );
  }
}
