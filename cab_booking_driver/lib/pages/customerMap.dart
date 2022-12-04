import 'package:cab_booking_driver/components/colorset.dart';
import 'package:cab_booking_driver/pages/homePage.dart';
import 'package:cab_booking_driver/widgets/selectbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CustomerMap extends StatelessWidget {
  const CustomerMap({required this.toLoc, required this.uid, Key? key})
      : super(key: key);
  final GeoPoint toLoc;
  final String uid;

  // launchMaps() async {
  //   String googleUrl =
  //       'comgooglemaps://?center=${toLoc.latitude},${toLoc.longitude}';
  //   String appleUrl =
  //       'https://maps.apple.com/?sll=${toLoc.latitude},${toLoc.longitude}';
  //   print(googleUrl);
  //   if (await canLaunch("comgooglemaps://")) {
  //     print('launching com googleUrl');
  //     await launch(googleUrl);
  //   } else if (await canLaunch(appleUrl)) {
  //     print('launching apple url');
  //     await launch(appleUrl);
  //   } else {
  //     throw 'Could not launch url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Column(
              children: [
                Image(
                  image: const AssetImage("assets/mapdemo.jpg"),
                  alignment: Alignment.center,
                  // height: Get.height/1.3,
                  width: Get.width,
                  fit: BoxFit.fitWidth,
                ),
                GestureDetector(
                  onTap: () {
                    // launchMaps();

                    MapsLauncher.launchCoordinates(
                        toLoc.latitude, toLoc.longitude, 'location');
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Colors.black),
                    child: Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                FirebaseFirestore.instance
                    .collection("bookings")
                    .doc(uid)
                    .update({
                  "status": "completed",
                });
                Get.to(const HomePage());
              },
              child: selectButton(
                hei: 70,
                boxCol: fontOffC,
                msg: "Journey End",
                fontW: FontWeight.w600,
                fontS: 20,
                fontCol: fontWhiteC,
                fontCen: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
