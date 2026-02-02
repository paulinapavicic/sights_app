import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_app_bar.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_primary_button.dart';
import 'package:sights_app/presentation/common/presentation/widget/custom_secondary_button.dart';

import '../../../../di.dart';

class ProfilePageScreen extends ConsumerStatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  ConsumerState<ProfilePageScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Profile"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        user?.photoURL != null && user!.photoURL!.isNotEmpty
                            ? user.photoURL!
                            : 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        (user?.displayName != null &&
                                user!.displayName!.isNotEmpty)
                            ? user.displayName!
                            : '-',
                        style: context.textTitle),
                    const SizedBox(height: 10),
                    Text(
                      (user?.email != null && user!.email!.isNotEmpty)
                          ? user.email!
                          : '-',
                      style: context.textStandard,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomSecondaryButton(
                        labelText: "Deactivate account",
                        onPressed: () {
                          ref
                              .read(authNotifierProvider.notifier)
                              .deleteUser(context);
                        }),
                    const SizedBox(height: 20),
                    CustomPrimaryButton(
                        labelText: "Sign out",
                        onPressed: () {
                          ref
                              .read(authNotifierProvider.notifier)
                              .signOut(context);
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
