import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/core/constants/app_colors.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/hive_helper/hive_boxes.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/view/widgets/app_search_delegate.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';
import 'dart:math' as math;

class SuraScreen extends StatefulWidget {
  const SuraScreen({Key? key}) : super(key: key);

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  late final SuraBloc _suraBloc = BlocProvider.of(context);
  late final Sura _sura = _suraBloc.sura;
  final _scrollController = ScrollController();

  List<VerseModel> verses = [];

  @override
  void initState() {
    super.initState();
    verses = HiveBoxes.verseBox.values
        .where((verse) => verse.suraId == _sura.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sura.nameUz ?? ""),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: AppSearchDelegate(verses),
              );
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              child: SvgPicture.asset(
                AppImages.basmalah,
                color: AppColors.black,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  VerseModel verse = verses[itemIndex];
                  return VerseListTile(verse: verse, query: "");
                }
                return const Divider(thickness: 1.0, height: 24.0);
              },
              childCount: math.max(0, verses.length * 2 - 1),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0))
        ],
      ),
    );
  }
}
