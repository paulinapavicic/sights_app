import 'package:flutter/material.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage("assets/images/empty_favorites.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 32.0),
                  child: Text(
                    "There are no favorites yet...",
                    style: context.textTitle.copyWith(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 32.0),
                  child: Text(
                    "Here you will see all your favorite sights. Mark them as favorite by pressing the heart icon.",
                    style: context.textStandard.copyWith(
                      color: context.textColor.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
