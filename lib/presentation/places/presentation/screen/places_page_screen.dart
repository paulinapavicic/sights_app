import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/common/presentation/screen/error_screen.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_app_bar.dart';
import 'package:sights_app/presentation/common/presentation/screen/loading_screen.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/favorite_place_state.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/place_state.dart';
import 'package:sights_app/presentation/places/presentation/widget/places_card_widget.dart';

class PlacesPageScreen extends ConsumerWidget {
  const PlacesPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesState = ref.watch(placesNotifierProvider);
    final favoritePlacesState = ref.watch(favoritePlacesNotifiesProvider);
    return switch (placesState) {
      LoadingPlaces() => const LoadingScreen(),
      ErrorPlaces() => const ErrorScreen(),
      EmptyPlaces() => const ErrorScreen(),
      SuccessPlaces() => Scaffold(
          appBar: const CustomAppBar(title: "Places"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: placesState.places.length,
              itemBuilder: (context, index) {
                final place = placesState.places[index];
                return Column(
                  children: [
                    PlacesCard(
                      place: place,
                      isFavorite: favoritePlacesState is SuccessFavoritePLaces
                          ? favoritePlacesState.favoritePlaces
                              .any((element) => element.placesId == place.id)
                          : false,
                    ),
                    if (index != placesState.places.length - 1)
                      const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
    };
  }
}
