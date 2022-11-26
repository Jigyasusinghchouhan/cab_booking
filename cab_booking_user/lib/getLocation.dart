import 'dart:async';
import 'package:cab_booking_user/ColorSet.dart';
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MapLoc extends StatefulWidget {
  const MapLoc({Key? key, required this.pickUp}) : super(key: key);
  final int pickUp;

  @override
  State<MapLoc> createState() => _MapLocState();
}

class _MapLocState extends State<MapLoc> {
  // final TextEditingController _toController = TextEditingController();

  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(18.551605, 73.838135);
  String location = "Search Location";

  LatLng? latLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Search Location",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: fontOffC,
          onPressed: () {
            // widget.pickUp == 1.1 || widget.pickUp == 1.2
            //     ? Get.off(() => const HomePage())
            //     :
            Get.back();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: fontOffC,
        onPressed: () {
          // location == "Search Location"
          //     ? showSnackBar(context, "Invalid location")
          //     : widget.pickUp == 1.1
          //         ? pickUpFromOut = location.obs
          //         : widget.pickUp == 1.2
          //             ? pickUpOut = location.obs
          //             : widget.pickUp == 2.1
          //                 ? pickUpRail = location.obs
          //                 : widget.pickUp == 3.1
          //                     ? pickUpAir = location.obs
          //                     : Container();
          // widget.pickUp == 1.1 || widget.pickUp == 1.2
          //     ? Get.off(() => const HomePage())
          //     :
          Get.back();
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: Stack(
        children: [
          Center(
            child: Image(
              image: const AssetImage("assets/mapdemo.jpg"),
              alignment: Alignment.center,
              // height: Get.height,
              width: Get.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            //search input bar

              child: InkWell(
                  onTap: () async {

                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: kGoogleApiKey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'in')],
                        //google_map_webservice package
                        onError: (err) {
                          print(err);
                        });

                    if (place != null) {
                      setState(() {
                        location = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(
                        apiKey: kGoogleApiKey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                      var newlatlang = LatLng(lat, lang);

                      //move map camera to selected place with animation
                      mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                      latLng = LatLng(lat, lang);
                      changeLocation(place.description.toString(),widget.pickUp);
                      getLocation(lat,lang,widget.pickUp);



                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title: Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )),
                    ),
                  ))),
          // Container(
          //   width: Get.width,
          //   height: Get.height,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage("assets/map.jpg"),
          //     ),
          //   ),
          // )
          // textF(
          //     lName: 'Pick up Point',
          //     hName: 'Your Location',
          //     controllers: _toController,
          //     foc: true,
          //     sIcon: Icon(
          //       Icons.my_location,
          //     )),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: GestureDetector(
          //     onTap: (){
          //       setState((){  PickUp=_toController.text;});
          //
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       color: Colors.black,
          //       height: 60,
          //       width: 60,
          //       child:  Icon(Icons.arrow_forward,color: Colors.white,),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
