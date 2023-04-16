/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 15:17:39
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';

class StarWidget extends StatelessWidget {
  final String content;
  const StarWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(AppIcons.hexagon, color: AppColors.indigo),
        Text(content)
      ],
    );
  }
}
