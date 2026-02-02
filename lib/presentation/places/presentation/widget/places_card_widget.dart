import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/common/presentation/utility/show_custom_alert_dialog.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:sights_app/presentation/places/presentation/widget/places_details_widget.dart';

class PlacesCard extends ConsumerWidget {
  final Place place;
  final bool isFavorite;

  const PlacesCard({
    super.key,
    required this.place,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            builder: (_) => PlacesDetailsWidget(place: place, isFavorite: isFavorite),);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              context.primaryColor,
              context.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(place.imageUrl),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.title,
                      overflow: TextOverflow.ellipsis,
                      style: context.textCardTitle.copyWith(
                        color: context.backgroundColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      place.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textCardSubtitle.copyWith(
                        color: context.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${place.lat}, ${place.lng}',
                      overflow: TextOverflow.ellipsis,
                      style: context.textCardSmall.copyWith(
                        color: context.backgroundColor,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: i < place.rating
                                ? context.primaryColor
                                : context.backgroundColor,
                          ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: context.backgroundColor,
                  ),
                  onPressed: () {
                    if (place.id != null) {
                      if (isFavorite) {
                        ref
                            .read(favoritePlacesNotifiesProvider.notifier)
                            .removeFavoritePlace(place.id!);
                      } else {
                        ref
                            .read(favoritePlacesNotifiesProvider.notifier)
                            .addFavoritePlace(place.id!);
                      }
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
            ],
          ),
        ),
      ),
    );
  }
}
