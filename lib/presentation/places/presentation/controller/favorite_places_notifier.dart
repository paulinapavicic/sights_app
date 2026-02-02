import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/places/domain/usecase/favorite_places_use_case.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/favorite_place_state.dart';

class FavoritePlacesNotifier extends Notifier<FavoritePlaceState> {
  late final FavoritePlacesUseCase _favoritePlacesUseCase;

  @override
  FavoritePlaceState build() {
    _favoritePlacesUseCase = ref.read(favoritePlacesUseCasesProvider);
    getAllFavoritePlaces();
    return const LoadingFavoritePlaces();
  }

  void getAllFavoritePlaces() async {
    state = const LoadingFavoritePlaces();
    final result = await _favoritePlacesUseCase.getAllPlaces();
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (favoritePlaces) {
        if (favoritePlaces == null || favoritePlaces.isEmpty) {
          state = const EmptyFavoritePlaces();
          return;
        }
        state = SuccessFavoritePLaces(favoritePlaces);
      },
    );
  }

  void addFavoritePlace(final int placeId) async {
    final result = await _favoritePlacesUseCase.addPlace(placeId);
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (_) => getAllFavoritePlaces(),
    );
  }

  void removeFavoritePlace(final int placeId) async {
    final result = await _favoritePlacesUseCase.deletePlace(placeId);
    result.fold(
      (failure) => state = ErrorFavoritePlaces(error: failure),
      (_) => getAllFavoritePlaces(),
    );
  }
}
