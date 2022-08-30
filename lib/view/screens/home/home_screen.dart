import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/hive_helper/hive_boxes.dart';
import 'package:quran/view/widgets/app_search_delegate.dart';
import 'package:quran/view/widgets/buttons/app_icon_button.dart';
import 'package:quran/view/widgets/sura_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuranUz _quranUz = QuranUz();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Қуръони карим'),
        actions: [
          AppIconButton(
            icon: CupertinoIcons.search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: AppSearchDelegate(HiveBoxes.verseBox.values.toList()),
              );
            },
          ),
        ],
      ),
      // drawer: const Drawer(),
      backgroundColor: AppColors.white,
      body: Scrollbar(
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          itemCount: _quranUz.suraList.length,
          separatorBuilder: (ctx, i) => Divider(height: 2.h),
          itemBuilder: (ctx, i) {
            Sura sura = _quranUz.suraList[i];
            return SuraListTile(surah: sura);
          },
        ),
      ),
    );
  }
}
