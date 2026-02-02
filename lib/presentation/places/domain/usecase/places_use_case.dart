import 'package:dartz/dartz.dart';
import 'package:sights_app/presentation/core/error/failure.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:sights_app/presentation/places/domain/repository/places_repository.dart';

class PlacesUseCase {
  final PlacesRepository _placesRepository;

  const PlacesUseCase(this._placesRepository);

  Future<Either<Failure, List<Place>?>> getAllPlaces() async {
    return await _placesRepository.getAllPlaces();
  }

  Future<Either<Failure, Place?>> getPlaceById(final int placeId) async {
    return await _placesRepository.getPlaceById(placeId);
  }

  Future<Either<Failure, void>> addPlace(final Place place) async {
    return await _placesRepository.addPlace(place);
  }

  Future<Either<Failure, void>> deletePlace(final int placeId) async {
    return await _placesRepository.deletePlace(placeId);
  }

}