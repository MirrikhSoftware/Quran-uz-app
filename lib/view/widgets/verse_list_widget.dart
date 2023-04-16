/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 16:03:11
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/view/widgets/sura_list_tile.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';

class VerseListWidget extends StatelessWidget {
  final List<Verse> verseList;
  final String query;
  const VerseListWidget({
    super.key,
    required this.verseList,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: verseList.length,
      separatorBuilder: (context, index) => const Divider(height: 24.0),
      itemBuilder: (context, index) {
        Verse verse = verseList[index];
        bool isTheSame = true;
        if (index == 0) {
          isTheSame = false;
        } else {
          isTheSame = verse.suraId == verseList[index - 1].suraId;
        }
        if (!isTheSame) {
          Sura sura = QuranUz().getSuraById(verse.suraId);
          return Column(
            children: [
              Container(
                  color: AppColors.indigo.withOpacity(.1),
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SuraListTile(surah: sura)),
              VerseListTile(verse: verse, query: query),
            ],
          );
        }
        return VerseListTile(
          verse: verse,
          query: query,
          key: ValueKey(verse.id),
        );
      },
    );
  }
}
