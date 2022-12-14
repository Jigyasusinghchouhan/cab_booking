import 'dart:math';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGoogleApiKey = "API_KEY";

final locate = YourLocation().obs;
final calLocation = CalLocation().obs;
double totalFareMini = 0;
double totalFareSedan = 0;
double totalFareSuv = 0;

final box = GetStorage();

class YourLocation {
  String pickUp;
  String pickUpFrom;


  YourLocation(
      {this.pickUp = "Drop Point",
        this.pickUpFrom = "Pick up Point",});
}
void changeLocation(String newLocation, int pickUp) {
  locate.update((thisLocation) {
    if (pickUp == 1) {
      thisLocation!.pickUp = newLocation;
   } else {
      thisLocation!.pickUpFrom = newLocation;
    }
  });
}

class CalLocation {
  var pickUpLat;
  var pickUpLag;
  var pickUpFromLat;
  var pickUpFromLag;


  CalLocation({
    this.pickUpLat = 0,
    this.pickUpLag = 0,
    this.pickUpFromLat = 0,
    this.pickUpFromLag = 0,


  });
}

void getLocation(double lat, double lag, int pickUp) {
  calLocation.update((thisLocation) {
    if (pickUp == 1) {
      thisLocation!.pickUpLat = lat;
      thisLocation.pickUpLag = lag;
    } else {

      thisLocation!.pickUpFromLat = lat;
      thisLocation.pickUpFromLag = lag;
    }
  });
}

// Total distance Calculator
double calculateDistance({lat1, lon1, lat2, lon2}) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

// Total poly distance Calculator
PolylinePoints polylinePoints = PolylinePoints();
List<LatLng> polylineCoordinates = [];
double totalDistance = 0;
double totalDistanceRoundOff = 0;

totalPolyDistanceCal() async {
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    kGoogleApiKey,
  PointLatLng(
      calLocation.value.pickUpLat,
      calLocation.value.pickUpLag,
    ),
    PointLatLng(calLocation.value.pickUpFromLat,
        calLocation.value.pickUpFromLag),

  );
  if (result.points.isNotEmpty) {
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
  } else {
    print(result.errorMessage);
  }

  totalDistance = 0;
  for (int i = 0; i < polylineCoordinates.length - 1; i++) {
    totalDistance += calculateDistance(
        lat1: polylineCoordinates[i].latitude,
        lon1: polylineCoordinates[i].longitude,
        lat2: polylineCoordinates[i + 1].latitude,
        lon2: polylineCoordinates[i + 1].longitude);
  }
  totalDistanceRoundOff=double.parse((totalDistance).toStringAsFixed(0));
  polylineCoordinates = [];
}
