import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/hive_helper/hive_boxes.dart';
import 'package:quran/models/verse/verse_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('ADD ALL'),
              onPressed: () async {
                QuranUz quranUz = QuranUz();
                List<VerseModel> verses = [];
                for (var verse in quranUz.verseList) {
                  VerseModel verseModel = VerseModel.fromJson(verse.toJson());
                  verses.add(verseModel);
                }
                await HiveBoxes.verseBox.addAll(verses);
              },
            ),
            ElevatedButton(
              child: const Text('PUT ALL'),
              onPressed: () async {
                QuranUz quranUz = QuranUz();
                Map<int, VerseModel> entries = {};
                for (var verse in quranUz.verseList) {
                  VerseModel verseModel = VerseModel.fromJson(verse.toJson());
                  entries[verseModel.key] = verseModel;
                }
                await HiveBoxes.verseBox.putAll(entries);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await HiveBoxes.verseBox.clear();
              },
              child: const Text('CLEAR BOX'),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('GET'),
            ),
          ],
        ),
      ),
    );
  }
}
