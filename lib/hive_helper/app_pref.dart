import 'package:quran/core/components/app_packages.dart';
import 'package:quran/hive_helper/hive_box_names.dart';

class AppPref {
  static final Box<dynamic> _box = Hive.box(HiveBoxNames.prefs);

  static Future setSaved() async => await _box.put(HiveKeys.saved, true);
  static bool get hasSaved => _box.get(HiveKeys.saved) ?? false;
}

class HiveKeys {
  static const String saved = 'saved';
}
