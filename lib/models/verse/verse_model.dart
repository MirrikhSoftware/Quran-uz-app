import 'package:hive/hive.dart';
import 'package:quran/hive_helper/hive_types.dart';
import 'package:quran/hive_helper/hive_adapters.dart';
import 'package:quran/hive_helper/fields/verse_model_fields.dart';


part 'verse_model.g.dart';


@HiveType(typeId: HiveTypes.verseModel, adapterName: HiveAdapters.verseModel)
class VerseModel extends HiveObject{
  VerseModel({
    required int id,
    required int paraNo,
    required int suraId,
    required int verseId,
    required String plain,
    required String arabic,
    required String meaning,
  }) {
    _id = id;
    _paraNo = paraNo;
    _suraId = suraId;
    _verseId = verseId;
    _plain = plain;
    _arabic = arabic;
    _meaning = meaning;
  }

  VerseModel.fromJson(dynamic json) {
    _id = json['id'];
    _paraNo = json['para_no'];
    _suraId = json['sura_id'];
    _verseId = json['verse_id'];
    _plain = json['plain'];
    _arabic = json['arabic'];
    _meaning = json['meaning'];
  }

  late int _id;
  late int _paraNo;
  late int _suraId;
  late int _verseId;
  late String _plain;
  late String _arabic;
  late String _meaning;

  VerseModel copyWith({
    required int id,
    required int paraNo,
    required int suraId,
    required int verseId,
    required String plain,
    required String arabic,
    required String meaning,
  }) =>
      VerseModel(
        id: id,
        paraNo: paraNo,
        suraId: suraId,
        verseId: verseId,
        plain: plain,
        arabic: arabic,
        meaning: meaning,
      );

  int get id => _id;

  int get paraNo => _paraNo;

  int get suraId => _suraId;

  int get verseId => _verseId;

  String get plain => _plain;

  String get arabic => _arabic;

  String get meaning => _meaning;

	@HiveField(VerseModelFields.)
  Map<String, dynamic> toJson() {
	@HiveField(VerseModelFields.dynamic>{})
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['para_no'] = _paraNo;
    map['sura_id'] = _suraId;
    map['verse_id'] = _verseId;
    map['plain'] = _plain;
    map['arabic'] = _arabic;
    map['meaning'] = _meaning;
	@HiveField(VerseModelFields.map)
    return map;
  }
}