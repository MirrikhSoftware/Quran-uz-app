import 'package:quran/core/components/app_packages.dart';
import 'package:quran/hive_helper/hive_box_names.dart';
import 'package:quran/models/verse/verse_model.dart';

class HiveBoxes {
  static Box<VerseModel> get verseBox => Hive.box(HiveBoxNames.verses);
  static Box<dynamic> get prefsBox => Hive.box(HiveBoxNames.prefs);

}
