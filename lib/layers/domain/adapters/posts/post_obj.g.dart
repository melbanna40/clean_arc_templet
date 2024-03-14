// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_obj.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post()
      ..id = fields[0] as String?
      ..image = fields[1] as String?
      ..likes = fields[2] as int?
      ..tags = (fields[3] as List?)?.cast<String>()
      ..text = fields[4] as String?
      ..publishDate = fields[5] as String?
      ..owner = fields[6] as Owner?;
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.likes)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.publishDate)
      ..writeByte(6)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
