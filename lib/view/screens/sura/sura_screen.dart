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
                title: Text(sura.nameUz!),
              ),
              SliverList(
                delegate: SliverChildListDelegate(_getVerseList(sura.id!)
                    .map(
                      (e) => VerseListTile(verse: e),
                    )
                    .toList()),
              )
            ],
          ),
        );
      },
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
