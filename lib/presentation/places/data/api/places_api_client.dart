import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sights_app/presentation/places/domain/entity/place.dart';
import 'package:retrofit/retrofit.dart';

part 'places_api_client.g.dart';

@RestApi(baseUrl: 'http://144.91.87.48:8080/sight/')
abstract class PlacesApiClient {

  factory PlacesApiClient(Dio dio, {String baseUrl}) = _PlacesApiClient;

  @GET('all')
  Future<List<Place>> getAllPlaces();

  @GET('{placeId}')
  Future<Place> getPlaceById(@Path('placeId') int placeId);

  @POST('save')
  Future<void> addPlace(@Body() Place place);

  @DELETE('{placeId}')
  Future<void> deletePlace(@Path('placeId') int placeId);

}

