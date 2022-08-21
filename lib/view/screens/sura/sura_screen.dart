import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/core/constants/app_colors.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';
import 'dart:math' as math;

class SuraScreen extends StatelessWidget {
  const SuraScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuraBloc, SuraState>(
      builder: (context, state) {
        SuraBloc suraBloc = context.watch();
        Sura sura = suraBloc.sura;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text(sura.nameUz!),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                  child: SvgPicture.asset(
                    AppImages.basmalah,
                    color: AppColors.black,
                  ),
                ),
              ),
              _showList(sura),
            ],
          ),
        );
      },
    );
  }

  SliverList _showList(Sura sura) {
    List<Verse> verseList = _getVerseList(sura.id!);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final int itemIndex = index ~/ 2;
          if (index.isEven) {
            Verse verse = verseList[itemIndex];
            return VerseListTile(verse: verse);
          }
          return Divider(thickness: 1.h);
        },
        childCount: math.max(0, verseList.length * 2 - 1),
      ),
    );
  }

  List<Verse> _getVerseList(int suraId) {
    QuranUz quranUz = QuranUz();
    List<Verse> verses = [];
    for (var verse in quranUz.verses) {
      if (suraId == verse.suraId) {
        verses.add(verse);
      }
    }

    return verses;
  }
}
