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
      ..writeByte(9)
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
      ..write(obj.arabic)
      ..writeByte(8)
      ..write(obj.audioX);
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

class AudioModelAdapter extends TypeAdapter<AudioModelX> {
  @override
  final int typeId = 1;

  @override
  AudioModelX read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioModelX(
      low: fields[0] as dynamic,
      medium: fields[2] as dynamic,
      lowSecondary: fields[1] as dynamic,
      mediumSecondary: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AudioModelX obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.low)
      ..writeByte(1)
      ..write(obj.lowSecondary)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.mediumSecondary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
