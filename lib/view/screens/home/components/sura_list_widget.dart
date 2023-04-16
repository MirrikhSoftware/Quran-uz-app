/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 15:09:27
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/view/widgets/sura_list_tile.dart';

class SuraListWidget extends StatelessWidget {
  final List<Sura> suraList;
  final ScrollController controller;
  const SuraListWidget({
    super.key,
    required this.suraList,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      child: ListView.separated(
        controller: controller,
        itemCount: suraList.length,
        separatorBuilder: (ctx, i) => const Divider(height: 2.0),
        itemBuilder: (ctx, i) {
          Sura sura = suraList[i];
          return SuraListTile(surah: sura);
        },
      ),
    );
  }
}
