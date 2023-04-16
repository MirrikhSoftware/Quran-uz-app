// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quran/core/core.dart';
import 'package:quran/hive_helper/hive_adapters.dart';
import 'package:quran/hive_helper/hive_types.dart';

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

  @override
  @HiveField(7)
  bool isSaved = false;

  @HiveField(8)
  AudioModelX get audioX => AudioModelX.fromJson(audio.toMap());

  @override
  get key => id;
}

@HiveType(
  typeId: HiveTypes.audioModel,
  adapterName: HiveAdapters.audioModelAdapter,
)
class AudioModelX extends AudioModel {
  AudioModelX({
    required super.low,
    required super.medium,
    required super.lowSecondary,
    required super.mediumSecondary,
  });

  @override
  @HiveField(0)
  String get low => super.low;

  @override
  @HiveField(1)
  String get lowSecondary => super.lowSecondary;

  @override
  @HiveField(2)
  String get medium => super.medium;

  @override
  @HiveField(3)
  String get mediumSecondary => super.mediumSecondary;

  factory AudioModelX.fromJson(Map<String, dynamic> json) => AudioModelX(
        low: json['low'],
        medium: json['medium'],
        lowSecondary: json['low_secondary'],
        mediumSecondary: json['medium_secondary'],
      );
}
