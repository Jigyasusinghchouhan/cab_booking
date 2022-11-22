import 'package:cab_booking_user/cabSelect.dart';
import 'package:cab_booking_user/colorset.dart';
import 'package:cab_booking_user/getLocation.dart';
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:cab_booking_user/Methods.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dateB = "0";
  bool dateSwitch = false;
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cab Book"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18,top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Get.to(MapLoc(
                        pickUp: 1,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: fontOffC),
                                    text: locate.value.pickUp),
                              ),
                            ),
                          ),
                          const Icon(Icons.my_location_rounded),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Destination:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Get.to(MapLoc(
                        pickUp: 2,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: fontOffC),
                                    text: locate.value.pickUpFrom),
                              ),
                            ),
                          ),
                          Icon(Icons.my_location_rounded),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pickup Date:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              onCancel: () {
                                setState(() {
                                  dateB = "0";
                                });
                              },
                              minTime: DateTime(now.year, now.month, now.day,
                                  now.hour, now.minute, 00),
                              onChanged: (date) {},
                              onConfirm: (date) {
                                setState(() {
                                  dateB =
                                  "${date.day}-${date.month}-${date.year} | ${date.hour} : ${date.minute}";

                                  dateSwitch = true;
                                });
                              },
                              currentTime: DateTime(now.year, now.month, now.day,
                                  now.hour, now.minute, 00));
                        },
                        child: dateSwitch == false
                            ? Text(
                          "DD-MM-YYYY | HH:MM",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        )
                            : Container(
                          child: dateB == "0"
                              ? Text(
                            "DD-MM-YYYY | HH:MM",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                              : Text(
                            dateB,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: SizedBox()),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Get.to(CabBook(
                    dateTime: '0',
                  ));
                },
                child: Center(
                  child: Container(
                    height: 60,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "Select Cab",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
