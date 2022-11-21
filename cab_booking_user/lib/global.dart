import 'package:get/get.dart';

const kGoogleApiKey = "AIzaSyDazGML38r08JtnYY_hb0qnG3JMQYGjIJo";

final locate = YourLocation().obs;
final calLocation = CalLocation().obs;




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
  var pickUpOutLat;
  var pickUpOutLag;


  CalLocation({
    this.pickUpOutLat = 0,
    this.pickUpOutLag = 0,

  });
}

void getLocation(double lat, double lag, int pickUp) {
  calLocation.update((thisLocation) {
    // if (pickUp == 1.1) {
      thisLocation!.pickUpOutLat = lat;
      thisLocation.pickUpOutLag = lag;
    // } else {
    //
    //   thisLocation!.pickUpFromAirLat = lat;
    //   thisLocation.pickUpFromAirLag = lag;
    // }
  });
}