/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 17:02:12
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/view/widgets/app_search_delegate.dart';
import 'package:quran/view/widgets/verse_list_widget.dart';

class JuzScreen extends StatefulWidget {
  final JuzModel juz;
  const JuzScreen({super.key, required this.juz});

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  List<Verse> _verses = [];
  @override
  void initState() {
    super.initState();
    QuranUz quranUz = QuranUz();
    _verses = quranUz.getVerseListByJuzNo(widget.juz.index ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: AppSearchDelegate(_verses),
              );
            },
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: VerseListWidget(verseList: _verses, query: ''),
    );
  }
}
