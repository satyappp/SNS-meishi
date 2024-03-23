// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SNSInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SNSInfoAdapter extends TypeAdapter<SNSInfo> {
  @override
  final int typeId = 1;

  @override
  SNSInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SNSInfo(
      name: fields[0] as String,
      url: fields[1] as String,
      icon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SNSInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SNSInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
