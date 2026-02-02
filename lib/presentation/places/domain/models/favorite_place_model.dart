import 'package:hive/hive.dart';

part 'favorite_place_model.g.dart';

@HiveType(typeId: 0)
class FavoritePlaceModel extends HiveObject {
  @HiveField(0)
  late int placesId;
}