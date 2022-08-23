import 'package:hive/hive.dart';
import 'package:quran/hive_helper/hive_types.dart';
import 'package:quran/hive_helper/hive_adapters.dart';

part 'verse_model.g.dart';

@HiveType(typeId: HiveTypes.verseModel, adapterName: HiveAdapters.verseModel)
class VerseModel extends HiveObject {
  VerseModel({
    int? id,
    int? paraNo,
    int? suraId,
    int? verseId,
    String? plain,
    String? arabic,
    String? meaning,
    bool isSaved = false,
  }) {
    _id = id;
    _paraNo = paraNo;
    _suraId = suraId;
    _verseId = verseId;
    _plain = plain;
    _arabic = arabic;
    _meaning = meaning;
    _isSaved = isSaved;
  }

  VerseModel.fromJson(dynamic json) {
    _id = json['id'];
    _paraNo = json['para_no'];
    _suraId = json['sura_id'];
    _verseId = json['verse_id'];
    _plain = json['plain'];
    _arabic = json['arabic'];
    _meaning = json['meaning'];
    _isSaved = json['is_saved'];
  }

  @HiveField(0)
  late int? _id;
  @HiveField(1)
  late int? _paraNo;
  @HiveField(2)
  late int? _suraId;
  @HiveField(3)
  late int? _verseId;
  @HiveField(4)
  late String? _plain;
  @HiveField(5)
  late String? _arabic;
  @HiveField(6)
  late String? _meaning;
  @HiveField(7)
  bool _isSaved = false;

  VerseModel copyWith({
    int? id,
    int? paraNo,
    int? suraId,
    int? verseId,
    String? plain,
    String? arabic,
    String? meaning,
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

  int? get id => _id;

  int? get paraNo => _paraNo;

  int? get suraId => _suraId;

  int? get verseId => _verseId;

  String? get plain => _plain;

  String? get arabic => _arabic;

  String? get meaning => _meaning;

  bool get isSaved => _isSaved;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['para_no'] = _paraNo;
    map['sura_id'] = _suraId;
    map['verse_id'] = _verseId;
    map['plain'] = _plain;
    map['arabic'] = _arabic;
    map['meaning'] = _meaning;
    map['is_saved'] = _isSaved;
    return map;
  }
}
