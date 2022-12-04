import 'dart:async';
import 'package:cab_booking_user/ColorSet.dart';
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
        backgroundColor: selectButtonC,
        onPressed: () async{
          Get.back();

        },
        child: Icon(Icons.arrow_forward_ios),
      ),

      body: Stack(
        children: [
          GoogleMap(
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
                    padding: EdgeInsets.only(left: 8,right: 8,top: 2),
                    child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Card(
                        child: Container(
                            child: ListTile(
                              title: Text(
                                location,
                                style: TextStyle(fontSize: 18),
                              ),
                              trailing: Icon(Icons.search),
                              dense: true,
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
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
                            Fluttertoast.showToast(
                            msg: "Got Your Current Location",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0),
                            });


                          });
                        },
                        child: Card(
                          child: Container(
                            height: 45,
                              child: Icon(Icons.my_location)),
                        ),
                      ),
                    ),
                  ],
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
