import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:sights_app/presentation/places/domain/usecase/places_use_case.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/place_state.dart';

class PlacesNotifier extends Notifier<PlacesState> {
  late final PlacesUseCase _placesUseCase;
  List<Place>? places;
  late Place? place;

  @override
  PlacesState build() {
    _placesUseCase = ref.read(placesUseCasesProvider);
    getAllPlaces();
    return const LoadingPlaces();
  }

  Future<void> getAllPlaces() async {
    state = const LoadingPlaces();
    final places = await _placesUseCase.getAllPlaces();
    places.fold((failure) {
      return state = ErrorPlaces(error: failure);
    }, (places) {
      if (places == null) {
        state = const EmptyPlaces();
      } else {
        state = SuccessPlaces(places);
        this.places = places;
      }
    });
  }

  Future<void> getPlaceById(final int placeId) async {
    state = const LoadingPlaces();
    final place = await _placesUseCase.getPlaceById(placeId);
    place.fold((failure) => state = ErrorPlaces(error: failure), (place) {
      if (place == null) {
        state = const EmptyPlaces();
      } else {
        state = SuccessPlaces([place]);
        this.place = place;
      }
    });
  }

  Future<void> addPlace(final Place place) async {
    state = const LoadingPlaces();
    final result = await _placesUseCase.addPlace(place);
    result.fold((failure) => state = ErrorPlaces(error: failure),
        (_) => getAllPlaces());
  }

  Future<void> deletePlace(final int placeId) async {
    state = const LoadingPlaces();
    final result = await _placesUseCase.deletePlace(placeId);
    result.fold((failure) => state = ErrorPlaces(error: failure),
        (_) => getAllPlaces());
  }
}
