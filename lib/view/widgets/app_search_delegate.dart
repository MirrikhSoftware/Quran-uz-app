import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/routes/app_navigator.dart';
import 'package:quran/view/widgets/sura_list_tile.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';

class AppSearchDelegate extends SearchDelegate {
  List<Verse> verses;
  AppSearchDelegate(this.verses);

  final QuranUz _quranUz = QuranUz();
  @override
  String? get searchFieldLabel => "Қидирув";

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: AppColors.white);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme().indigo.copyWith(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.white.withOpacity(0.6)),
          ),
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            AppNavigator.pop();
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const IconButton(
      onPressed: AppNavigator.pop,
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _showResult();

  @override
  Widget buildSuggestions(BuildContext context) => _showResult();

  Widget _showResult() => FutureBuilder(
        future: _getFoundedItems(),
        builder: (context, AsyncSnapshot<List<Verse>> snapshot) {
          if (query.isEmpty) {
            return const SizedBox();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Юкланяпти'));
          }

          if (snapshot.hasData) {
            List<Verse> foundVerses = snapshot.requireData;
            return ListView.builder(
              itemCount: foundVerses.length,
              itemBuilder: (context, index) {
                Verse verse = foundVerses[index];
                bool isTheSame = true;
                if (index == 0) {
                  isTheSame = false;
                } else {
                  isTheSame = verse.suraId == foundVerses[index - 1].suraId;
                }
                if (!isTheSame) {
                  Sura sura = _quranUz.getSuraById(verse.suraId);
                  return Column(
                    children: [
                      Container(
                          color: AppColors.primary.withOpacity(.1),
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
          return const SizedBox();
        },
      );

  Future<List<Verse>> _getFoundedItems() async {
    final target = query.toUpperCase();
    List<Verse> foundedItems = verses.where((verse) {
      if (verse.meaning.toUpperCase().contains(target)) {
        return true;
      }
      return false;
    }).toList();
    return foundedItems;
  }
}
