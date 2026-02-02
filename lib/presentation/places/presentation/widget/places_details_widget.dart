import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/common/presentation/utility/maps_utils.dart';
import 'package:sights_app/presentation/common/presentation/utility/show_custom_alert_dialog.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_primary_button.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';

class PlacesDetailsWidget extends ConsumerWidget {
  final Place place;
  final bool isFavorite;

  const PlacesDetailsWidget(
      {super.key, required this.place, this.isFavorite = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(place.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: context.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          transform: Matrix4.translationValues(-40.0, -20.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [
                                context.primaryColor,
                                context.secondaryColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: context.backgroundColor,
                            ),
                            onPressed: () {
                              if (place.id != null) {
                                if (isFavorite) {
                                  ref
                                      .read(favoritePlacesNotifiesProvider
                                          .notifier)
                                      .removeFavoritePlace(place.id!);
                                } else {
                                  ref
                                      .read(favoritePlacesNotifiesProvider
                                          .notifier)
                                      .addFavoritePlace(place.id!);
                                }
                                Navigator.of(context).pop();
                              } else {
                                if (context.mounted) {
                                  showCustomAlertDialog(
                                    context,
                                    'Place id is null',
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      Text(
                        place.title,
                        style: context.textTitle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      Text(place.address, style: context.textStandard),
                      const SizedBox(height: 8),
                      Text("Rating", style: context.textStandard),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              Icons.star,
                              color: i < place.rating
                                  ? context.primaryColor
                                  : context.shadowColor,
                            ),
                        ],
                      ),
                      Text(
                        place.description,
                        style: context.textDescription,
                      ),
                      const Spacer(),
                      CustomPrimaryButton(
                        labelText: 'Show on maps',
                        onPressed: () {
                          MapUtils.openMap(context, place.lat, place.lng);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
