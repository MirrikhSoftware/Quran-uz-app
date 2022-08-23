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
                int init = DateTime.now().millisecondsSinceEpoch;
                QuranUz quranUz = QuranUz();
                List<VerseModel> verses = [];
                for (var verse in quranUz.verses) {
                  VerseModel verseModel = VerseModel.fromJson(verse.toJson());
                  verses.add(verseModel);
                }
                await HiveBoxes.verseBox.addAll(verses);

                int end = DateTime.now().millisecondsSinceEpoch;
                print('SARFLANGA VAQT: ${end - init}');
              },
            ),
            ElevatedButton(
              child: const Text('PUT ALL'),
              onPressed: () async {
                int init = DateTime.now().millisecondsSinceEpoch;
                QuranUz quranUz = QuranUz();
                Map<int, VerseModel> entries = {};
                for (var verse in quranUz.verses) {
                  VerseModel verseModel = VerseModel.fromJson(verse.toJson());
                  entries[verseModel.key] = verseModel;
                }
                await HiveBoxes.verseBox.putAll(entries);

                int end = DateTime.now().millisecondsSinceEpoch;
                print('SARFLANGA VAQT: ${end - init}');
              },
            ),
            ElevatedButton(
              onPressed: () async {
                int init = DateTime.now().millisecondsSinceEpoch;
                await HiveBoxes.verseBox.clear();

                int end = DateTime.now().millisecondsSinceEpoch;
                print('SARFLANGA VAQT: ${end - init}');
              },
              child: const Text('CLEAR BOX'),
            ),
            ElevatedButton(
              onPressed: () async {
                VerseModel? verseModel = HiveBoxes.verseBox.get(1);
                print(verseModel?.toJson());
              },
              child: const Text('GET'),
            ),
          ],
        ),
      ),
    );
  }
}
