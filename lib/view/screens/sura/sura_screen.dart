import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/core/constants/app_colors.dart';
import 'package:quran/core/constants/app_images.dart';
import 'package:quran/hive_helper/hive_boxes.dart';
import 'package:quran/models/verse/verse_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.verseBox.listenable(),
        builder: (context, Box<VerseModel> box, child) {
          List<VerseModel> verses =
              box.values.where((verse) => verse.suraId == _sura.id).toList();
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                title: Text(_sura.nameUz!),
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final int itemIndex = index ~/ 2;
                    if (index.isEven) {
                      VerseModel verse = verses[itemIndex];
                      return VerseListTile(verse: verse);
                    }
                    return Divider(thickness: 1.h, height: 24.h);
                  },
                  childCount: math.max(0, verses.length * 2 - 1),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h))
            ],
          );
        },
      ),
    );
  }
}
