import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  const AppIconButton({ Key? key ,required this.icon, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(icon),
      onPressed: onPressed,
    );
  }
}