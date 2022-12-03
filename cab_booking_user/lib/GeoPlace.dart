import 'dart:async';
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoPlace extends StatefulWidget {
  const GeoPlace({Key? key, required this.pickUp}) : super(key: key);
  final int pickUp;
  @override
  _GeoPlaceState createState() => _GeoPlaceState();
}

class _GeoPlaceState extends State<GeoPlace> {
  Completer<GoogleMapController> _controller = Completer();
  String? _currentAddress;
// on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(28.644800, 77.216721),
    zoom: 14.4746,
  );

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(28.644800, 77.216721),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

  Future<void> _getAddressFromLatLng(double lat,double lan) async {
    await placemarkFromCoordinates(
        28.644800, 77.216721)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });


    }).catchError((e) {
      debugPrint(e);
    });
  }
// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // on below line we have given title of app
        title: Text("Location"),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),


      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());
            // marker added for current users location
            await _getAddressFromLatLng(value.latitude,value.longitude);
            print(_currentAddress);
            changeLocation(_currentAddress.toString(),widget.pickUp);
            getLocation(value.latitude,value.longitude,widget.pickUp);
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );

            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition)).then((value) => {
              Timer(Duration(seconds: 3), () {
                Get.back();
              })

            });

            setState(() {
            });
          });
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
