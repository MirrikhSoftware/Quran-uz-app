import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';

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
              _verseList(sura),
            ],
          ),
        );
      },
    );
  }

  SliverToBoxAdapter _verseList(Sura sura) {
    List<Verse> verses = _getVerseList(sura.id!);
    return SliverToBoxAdapter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: verses.length,
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (ctx, i) {
          Verse verse = verses[i];
          return VerseListTile(verse: verse);
        },
      ),
    );
  }

  List<Verse> _getVerseList(int suraId) {
    QuranUz quranUz = QuranUz();
    List<Verse> verses = [];
    int init = DateTime.now().millisecondsSinceEpoch;
    for (var verse in quranUz.verses) {
      if (suraId == verse.suraId) {
        verses.add(verse);
      }
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print(end - init);

    return verses;
  }
}
