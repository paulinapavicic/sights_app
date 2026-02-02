import 'package:hive_flutter/hive_flutter.dart';
import 'package:sights_app/presentation/places/domain/models/favorite_place_model.dart';

class FavoritePlacesService {
  final String _boxName = "favoritePlaceBox";

  Future<Box<FavoritePlaceModel>> get _box async =>
      await Hive.openBox<FavoritePlaceModel>(_boxName);

//create
  Future<void> addFavoritePlace(int favoritePlacesId) async {
    final box = await _box;
    final favoritePlaces = FavoritePlaceModel()..placesId = favoritePlacesId;

    await box.add(favoritePlaces);
  }

//read
  Future<List<FavoritePlaceModel>> getAllFavoritePlaces() async {
    final box = await _box;
    return box.values.toList();
  }

//delete
  Future<void> removeFavoritePlaces(int favoritePlacesId) async {
    final box = await _box;
    final deleteIndex = box.values.toList().indexWhere(
        (element) => element.placesId == favoritePlacesId);
    await box.deleteAt(deleteIndex);
  }
}
