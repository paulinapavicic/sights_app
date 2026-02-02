import 'package:dartz/dartz.dart';
import 'package:sights_app/presentation/core/error/failure.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:sights_app/presentation/places/domain/models/favorite_place_model.dart';

abstract interface class FavoritePlacesRepository {
  Future<Either<Failure, List<FavoritePlaceModel>?>> getAllFavoritePlaces();

  Future<Either<Failure, void>> addFavoritePlace (final int placeId);

  Future<Either<Failure, void>> removeFavoritePlaces(final int placeId);

}
