import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/presentation/core/error/failure.dart';
import 'package:sights_app/presentation/places/data/api/places_api_client.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:sights_app/presentation/places/domain/repository/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesApiClient _api;

  const PlacesRepositoryImpl(this._api);

  @override
  Future<Either<Failure, void>> addPlace(Place place) async {
    try {
      final result = await _api.addPlace(place);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePlace(int placeId) async{
    try {
      final result = await _api.deletePlace(placeId);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Place>?>> getAllPlaces() async{
    try {
      final result = await _api.getAllPlaces();
      return Right(result as List<Place>?);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Place?>> getPlaceById(int placeId) async {
    try {
      final result = await _api.getPlaceById(placeId);
      return Right(result as Place?);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseError(message: e.message ?? ''));
    } on Exception catch (e) {
      return Left(GeneralError(message: e.toString()));
    }
  }
}