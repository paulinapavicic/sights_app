import 'package:dartz/dartz.dart';
import 'package:sights_app/presentation/core/error/failure.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';

abstract interface class PlacesRepository {
  Future<Either<Failure, List<Place>?>> getAllPlaces();

  Future<Either<Failure, Place?>> getPlaceById(final int placeId);

  Future<Either<Failure, void>> addPlace(final Place place);

  Future<Either<Failure, void>> deletePlace(final int placeId);
}
