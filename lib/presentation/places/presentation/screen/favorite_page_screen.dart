import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/presentation/common/presentation/screen/empty_screen.dart';
import 'package:sights_app/presentation/common/presentation/screen/error_screen.dart';
import 'package:sights_app/presentation/common/presentation/screen/loading_screen.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_app_bar.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/favorite_place_state.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/place_state.dart';
import 'package:sights_app/presentation/places/presentation/widget/places_card_widget.dart';

import '../../../../di.dart';

class FavoritePageScreen extends ConsumerWidget {
  const FavoritePageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPlaces = ref.watch(placesNotifierProvider);
    final favoritePlacesState = ref.watch(favoritePlacesNotifiesProvider);
    return switch (favoritePlacesState) {
      LoadingFavoritePlaces() => const LoadingScreen(),
      ErrorFavoritePlaces() => const ErrorScreen(),
      EmptyFavoritePlaces() => const EmptyScreen(),
      SuccessFavoritePLaces() => Scaffold(
          appBar: const CustomAppBar(title: "Places"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: favoritePlacesState.favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = allPlaces is SuccessPlaces
                    ? allPlaces.places.firstWhere((element) =>
                        element.id ==
                        favoritePlacesState.favoritePlaces[index].placesId)
                    : null;
                return Column(
                  children: [
                    place != null
                        ? PlacesCard(place: place, isFavorite: true)
                        : const SizedBox(),
                    if (index != favoritePlacesState.favoritePlaces.length - 1)
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
