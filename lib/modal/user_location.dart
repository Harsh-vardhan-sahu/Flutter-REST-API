import 'package:flutter/cupertino.dart';

class Userlocation{
  final String city;
  final String state;
  final String country;
  final LocationStreet street;
  final LocationCoordinate coordinate;
  final LocationTimezoneCoordinate timezone;
  final String postcode;
  Userlocation(
      {
        required this.city,
        required this.state,
        required this.country,
        required this.postcode,
        required this.coordinate,
        required this.street,
        required this.timezone
      }
      );
}
class LocationStreet{
  final int  number;
  final String name;
  LocationStreet({
    required this .name,
    required this.number,
});
}
class LocationCoordinate{
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude,
    required this.longitude,
});
}
class LocationTimezoneCoordinate{
   final String offset;
   final String description;
  LocationTimezoneCoordinate({
  required this.description,
  required this.offset,
});
}