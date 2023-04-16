import 'package:quran/core/core.dart';
import 'package:quran/hive_helper/hive_types.dart';
import 'package:quran/hive_helper/hive_adapters.dart';
import 'package:quran_uz/src/models/audio_model.dart';

part 'verse_model.g.dart';

@HiveType(
  typeId: HiveTypes.verseModel,
  adapterName: HiveAdapters.verseModel,
)
class VerseModel extends Verse with HiveObjectMixin {
  @override
  @HiveField(0)
  int get id => super.id;

  @override
  @HiveField(1)
  int get juzNo => super.juzNo;

  @override
  @HiveField(2)
  int get suraId => super.suraId;

  @override
  @HiveField(3)
  int get verseId => super.verseId;

  @override
  @HiveField(4)
  String get plain => super.plain;

  @override
  @HiveField(5)
  String get meaning => super.meaning;

  @override
  @HiveField(6)
  String get arabic => super.arabic;

  @HiveField(7)
  bool isSaved = false;

  // @override
  // @HiveField(8)
  // AudioModel get audio => super.audio;

  @override
  get key => id;
}

class AudioModelX extends AudioModel {
  AudioModelX({
    required super.low,
    required super.medium,
    required super.lowSecondary,
    required super.mediumSecondary,
  });
}
