import 'package:flutter/material.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/routes/app_navigator.dart';
import 'package:quran/view/widgets/verse_list_tile.dart';

class AppSearchDelegate extends SearchDelegate {
  List<VerseModel> verses;
  AppSearchDelegate(this.verses);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
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
        builder: (context, AsyncSnapshot<List<VerseModel>> snapshot) {
          if (query.isEmpty) {
            return const SizedBox();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading'));
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                VerseModel verse = snapshot.data![index];
                return VerseListTile(verse: verse);
              },
            );
          }
          return SizedBox();
        },
      );

  Future<List<VerseModel>> _getFoundedItems() async {
    List<VerseModel> foundedItems = verses.where((verse) {
      if (verse.meaning!.toUpperCase().contains(query.toUpperCase())) {
        return true;
      }
      return false;
    }).toList();
    return foundedItems;
  }
}
