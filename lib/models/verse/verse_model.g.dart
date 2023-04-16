// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersionModelAdapter extends TypeAdapter<VerseModel> {
  @override
  final int typeId = 0;

  @override
  VerseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VerseModel()..isSaved = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, VerseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(7)
      ..write(obj.isSaved)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.juzNo)
      ..writeByte(2)
      ..write(obj.suraId)
      ..writeByte(3)
      ..write(obj.verseId)
      ..writeByte(4)
      ..write(obj.plain)
      ..writeByte(5)
      ..write(obj.meaning)
      ..writeByte(6)
      ..write(obj.arabic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
