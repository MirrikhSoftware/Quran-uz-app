import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/routes/app_navigator.dart';
import 'package:quran/view/widgets/verse_list_widget.dart';

class AppSearchDelegate extends SearchDelegate {
  List<Verse> verses;
  AppSearchDelegate(this.verses);

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

  Widget _showResult() {
    List<Verse> foundVerses = _getFoundedItems();
    if (foundVerses.isEmpty) {
      return const Center(child: Text('Топилмади'));
    }
    return VerseListWidget(
      verseList: foundVerses,
      query: query,
    );
  }

  List<Verse> _getFoundedItems() {
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
