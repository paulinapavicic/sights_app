import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/presentation/auth/notifier/authentication_notifier.dart';
import 'package:sights_app/presentation/auth/notifier/state/authentication_state.dart';
import 'package:sights_app/presentation/auth/usecase/auth_use_case.dart';
import 'package:sights_app/presentation/places/data/api/places_api_client.dart';
import 'package:sights_app/presentation/places/data/db/places_hive_services.dart';
import 'package:sights_app/presentation/places/data/repository/favorite_places_repository_impl.dart';
import 'package:sights_app/presentation/places/data/repository/places_repository_impl.dart';
import 'package:sights_app/presentation/places/domain/repository/favorite_places_repository.dart';
import 'package:sights_app/presentation/places/domain/repository/places_repository.dart';
import 'package:sights_app/presentation/places/domain/usecase/favorite_places_use_case.dart';
import 'package:sights_app/presentation/places/domain/usecase/places_use_case.dart';
import 'package:sights_app/presentation/places/presentation/controller/favorite_places_notifier.dart';
import 'package:sights_app/presentation/places/presentation/controller/places_notifier.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/favorite_place_state.dart';
import 'package:sights_app/presentation/places/presentation/controller/state/place_state.dart';

import 'data/client/firebase_auth_client.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/repository/user_repository.dart';


// ***************** EXTERNAL LIBRARIES ***************** //
final dioProvider = Provider<Dio>((ref) => Dio());
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);


// ***************** DATASOURCE ***************** //
final userFirebaseApi = Provider<FirebaseAuthClient>((ref) =>
    FirebaseAuthClient(ref.watch(firebaseAuthProvider))
);

final placesApiProvider = Provider<PlacesApiClient>((ref) =>
    PlacesApiClient(ref.watch(dioProvider))
);

// ***************** SERVICE ***************** //
final favoritePlacesService = Provider<FavoritePlacesService>((ref) =>
    FavoritePlacesService()
);

// ***************** REPOSITORY ***************** //
final userFirebaseRepositoryProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.watch(userFirebaseApi)),
);

final placesRepositoryProvider = Provider<PlacesRepository>(
      (ref) => PlacesRepositoryImpl(ref.watch(placesApiProvider)),
);

final favoritePlacesRepositoryProvider = Provider<FavoritePlacesRepository>(
      (ref) => FavoritePlacesRepositoryImpl(ref.watch(favoritePlacesService)),
);

// ***************** USE CASE ***************** //
final authUseCasesProvider = Provider<AuthUseCase>(
      (ref) => AuthUseCase(ref.watch(userFirebaseRepositoryProvider)),
);

final placesUseCasesProvider = Provider<PlacesUseCase>(
      (ref) => PlacesUseCase(ref.watch(placesRepositoryProvider)),
);

final favoritePlacesUseCasesProvider = Provider<FavoritePlacesUseCase>(
      (ref) => FavoritePlacesUseCase(ref.watch(favoritePlacesRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final authNotifierProvider = NotifierProvider<AuthenticationNotifier, AuthenticationState>(
      () => AuthenticationNotifier(),
);

final placesNotifierProvider = NotifierProvider<PlacesNotifier, PlacesState>(
      () => PlacesNotifier(),
);

final favoritePlacesNotifiesProvider = NotifierProvider<FavoritePlacesNotifier, FavoritePlaceState>(
      () => FavoritePlacesNotifier(),
);




