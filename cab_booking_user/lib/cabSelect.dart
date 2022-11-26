
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:cab_booking_user/bookingDetails.dart';
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
      // backgroundColor:Colors.green.shade50,
      appBar: AppBar(
        title: Text("Select Cab"),
        backgroundColor: Colors.green,
centerTitle: true,
      ),

      body: Column(

        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(

                    children: [
                      SizedBox(height: 3,),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                18.0),
                          ),
                          color: Colors.green,
                        ),
                        height: 10,
                        width: 10,
                      ),
                      Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                18.0),
                          ),
                          color: Colors.red,
                        ),
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              text:
                              locate.value.pickUp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              text:
                              locate.value.pickUpFrom),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // const Center(child: Text("-"),),
          //


          Center(
            child:Text(widget.dateTime=="0"? DateTime.now().toString():widget.dateTime,

              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Distance: $totalDistanceRoundOff KM",
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
              Get.to(BookingDetails(
                carType: "Mini", dateTime: widget.dateTime, fare:  totalFareMini.toString(),

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
                              totalFareMini.toString(),
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
              Get.to(BookingDetails(
                carType: "Sedan",dateTime: widget.dateTime, fare:  totalFareSedan.toString(),
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
                              totalFareSedan.toString(),
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
              Get.to(BookingDetails(
                carType: "SUV",dateTime: widget.dateTime, fare:  totalFareSuv.toString(),

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
                              totalFareSuv.toString(),
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