import 'dart:io';

import 'package:path_provider/path_provider.dart' as pp;
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/hive_helper/hive_box_names.dart';
import 'package:quran/models/verse/verse_model.dart';

class HiveInit {
  static Future init() async {
    Directory directory = await pp.getApplicationSupportDirectory();
    String path = directory.path;
    await Hive.initFlutter(path);

    Hive.registerAdapter(VersionModelAdapter());

    await Hive.openBox<VerseModel>(HiveBoxNames.verses);
  }
}
