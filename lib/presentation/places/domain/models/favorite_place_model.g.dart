// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_place_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritePlaceModelAdapter extends TypeAdapter<FavoritePlaceModel> {
  @override
  final int typeId = 0;

  @override
  FavoritePlaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritePlaceModel()..placesId = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, FavoritePlaceModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.placesId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritePlaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
