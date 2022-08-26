import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quran/core/constants/constants.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/view/widgets/buttons/app_icon_button.dart';
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
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _showResult();

  @override
  Widget buildSuggestions(BuildContext context) => _showResult();

  Widget _showResult() => ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          VerseModel verse = [][index];
          return VerseListTile(verse: verse);
        },
      );
}
