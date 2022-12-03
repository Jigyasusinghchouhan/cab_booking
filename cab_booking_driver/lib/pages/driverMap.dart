import 'package:cab_booking_driver/components/colorset.dart';
import 'package:cab_booking_driver/pages/customerMap.dart';
import 'package:cab_booking_driver/widgets/selectbutton.dart';
import 'package:cab_booking_driver/widgets/textF.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';


class DriveMap extends StatelessWidget {
  DriveMap(
      {required this.date,
        required this.fromLoc,
        required this.toLoc,
        required this.uid,
        Key? key})
      : super(key: key);

  final String date;
  final GeoPoint fromLoc;
  final GeoPoint toLoc;
  final String uid;
  final TextEditingController _otpController = TextEditingController();

  // launchMaps() async {
  //   String googleUrl =
  //       'comgooglemaps://?center=${fromLoc.latitude},${fromLoc.longitude}';
  //   String appleUrl =
  //       'https://maps.apple.com/?sll=${fromLoc.latitude},${fromLoc.longitude}';
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
      appBar: AppBar(
        title: Text("Get Location"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: () {
                MapsLauncher.launchCoordinates(
                    toLoc.latitude, toLoc.longitude, 'location');

              },
              child: Card(
                color: Colors.grey,
                child: Center(
                  child: Container(
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/mapdemo.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: Get.height / 8,
                    width: Get.width / 3,
                    // child: Center(child: Text("\n\n\n\nGet Location")
                  ),
                ),
              ),
            ),
          ),

          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Arrive Before: 10:15 pm",
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Enter OTP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: textF(
                        icon: const Icon(Icons.password_rounded),
                        lName: "OTP",
                        // hName: "Enter Otp Code",
                        controllers: _otpController),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        Get.to( CustomerMap(toLoc: toLoc,uid: uid,));
                      },
                      child: selectButton(
                        hei: 60,
                        boxCol: fontOffC,
                        msg: "Apply",
                        fontW: FontWeight.w600,
                        fontS: 20,
                        fontCol: fontWhiteC,
                        fontCen: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
