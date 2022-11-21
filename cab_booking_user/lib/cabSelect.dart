
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:cab_booking_user/cabDetails.dart';
class CabBook extends StatefulWidget {
  const CabBook({Key? key, required this.dateTime}) : super(key: key);
  final String dateTime;

  @override
  State<CabBook> createState() => _CabBookState();
}

class _CabBookState extends State<CabBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green,
      appBar: AppBar(
        title: Text("Select Cab"),

      ),

      body: Column(
        children: [
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  text:
                  "userEntries.value.fromName"),
              textAlign: TextAlign.center,
            ),
          ),
          const Center(child: Text("-"),),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  text:
                  "userEntries.value.desName"),
            ),
          ),


          Center(
            child: Text(DateTime.now().toString(),
              // userEntries.value.fromName == "0"
              //     ? "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}"
              //     : userEntries.value.pickUpDate,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Distance:120",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Get.to(DetailsPage(
                carType: "Mini",
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Card(
                elevation: 5,
                color: Colors.green,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                        height: 70,
                        width: 80,
                        child: Image.asset("assets/car/C1.png"),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                              "Mini Cabs",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 27,
                                  color: Colors.black),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "₹30",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.to(DetailsPage(
                carType: "Sedan",
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Card(
                elevation: 5,
                color: Colors.green,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                        height: 70,
                        width: 80,
                        child: Image.asset("assets/car/C2.png"),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                              "Sedan Cabs",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 27,
                                  color: Colors.black),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "₹60",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: ()  {
              Get.to(DetailsPage(
                carType: "SUV",

              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Card(
                elevation: 5,
                color: Colors.green,
                // width:Get.width/1.1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                        height: 70,
                        width: 80,
                        child: Image.asset("assets/car/C3.png"),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                              "SUV Cabs",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 27,
                                  color: Colors.black),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "₹90",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ))),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(CabConfirm(
          //       car: "One Way Special",
          //     ));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 18.0, right: 18),
          //     child: Card(
          //       elevation: 5,
          //       color: buttonBoxColors,
          //       child: Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 18.0, right: 18),
          //             child: Container(
          //               height: 70,
          //               width: 80,
          //               child: Expanded(
          //                 child: Image.asset("assets/car/C4.png"),
          //               ),
          //             ),
          //           ),
          //           Expanded(
          //               flex: 2,
          //               child: Text(
          //                 "One Way Special",
          //                 style: TextStyle(
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 22,
          //                 color: fontOffColors),textAlign: TextAlign.center,
          //               )),
          //           Expanded(
          //               child: Center(
          //                   child: Text(
          //             "₹3731",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 20,
          //                 color: fontOffColors),
          //           ))),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }


}