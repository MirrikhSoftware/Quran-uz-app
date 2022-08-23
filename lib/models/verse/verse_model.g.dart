// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersionModelAdaptercha extends TypeAdapter<VerseModel> {
  @override
  final int typeId = 0;

  @override
  VerseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerseModel()
      .._id = fields[0] as int
      .._paraNo = fields[1] as int
      .._suraId = fields[2] as int
      .._verseId = fields[3] as int
      .._plain = fields[4] as String
      .._arabic = fields[5] as String
      .._meaning = fields[6] as String
      .._isSaved = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, VerseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._paraNo)
      ..writeByte(2)
      ..write(obj._suraId)
      ..writeByte(3)
      ..write(obj._verseId)
      ..writeByte(4)
      ..write(obj._plain)
      ..writeByte(5)
      ..write(obj._arabic)
      ..writeByte(6)
      ..write(obj._meaning)
      ..writeByte(7)
      ..write(obj._isSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionModelAdaptercha &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
