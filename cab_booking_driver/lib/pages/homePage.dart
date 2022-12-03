import 'package:cab_booking_driver/components/colorset.dart';
import 'package:cab_booking_driver/components/gobal.dart';
import 'package:cab_booking_driver/pages/ridePage.dart';
import 'package:cab_booking_driver/widgets/appdrawer.dart';
import 'package:cab_booking_driver/widgets/selectbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  taskBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
      child: GestureDetector(
        onTap: () {
          // Get.to(RidePage());
        },
        child: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: buttonBoxC),
          width: Get.width / 1.15,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                top: 17,
                left: 50,
                child: Text(
                  "Pickup Point",
                  style: TextStyle(color: fontOnC, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 17,
                right: 15,
                child: Text(
                  "12:30 pm",
                  style: TextStyle(color: fontOnC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkPage = false;
  bool isFetching = false;
  List<String> dataList = [];

  @override
  void initState() {
    super.initState();

    // getGroupsData();
  }

  // getGroupsData() {
  //   setState(() {
  //     isFetching = true;
  //   });
  //
  //   FirebaseFirestore.instance.collection("drivers").get().then(
  //         (QuerySnapshot snapshot) {
  //       snapshot.docs.forEach((f) {
  //         dataList.add(f["name"]);
  //       });
  //     },
  //   );
  //
  //   setState(() {
  //     isFetching = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: fontOnC),
      ),
      drawer: AppDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bookings')

            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("There is no expense");
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkPage = false;
                            });
                          },
                          child: selectButton(
                            msg: "Upcomming",
                            hei: 50,
                            wid: Get.width / 2.2,
                            boxCol:
                            checkPage == true ? Colors.black12 : fontOffC,
                            fontCol: checkPage == true ? fontOffC : fontWhiteC,
                            fontCen: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkPage = true;
                            });
                          },
                          child: selectButton(
                            msg: "Completed",
                            hei: 50,
                            wid: Get.width / 2.2,
                            boxCol:
                            checkPage == false ? Colors.black12 : fontOffC,
                            fontCol: checkPage == false ? fontOffC : fontWhiteC,
                            fontCen: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        checkPage == false && snapshot.data!.docs[index]["status"] !=
                            "completed"
                            ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(RidePage(
                                name: snapshot.data!.docs[index]["name"],
                                des: snapshot.data!.docs[index]["To"],
                                pic: snapshot.data!.docs[index]["From"],
                                date: snapshot.data!.docs[index]["userDate"]
                                    .toDate(),
                                num: snapshot.data!.docs[index]["phone"],
                                pickUpLoc: GeoPoint(
                                  snapshot.data!.docs[index]["fromLoc"]
                                      .latitude,
                                  snapshot.data!.docs[index]["fromLoc"]
                                      .longitude,
                                ),
                                dropDownLoc: GeoPoint(
                                  snapshot.data!.docs[index]["toLoc"]
                                      .latitude,
                                  snapshot.data!.docs[index]["toLoc"]
                                      .longitude,
                                ),
                                totalPrice: snapshot.data!.docs[index]
                                ["totalFare"],
                                uid: snapshot.data!.docs[index].id,
                              ));
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),

                              // width: Get.width / 1.15,
                              // height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Date:${DateFormat.yMMMd().add_jm().format(snapshot.data!.docs[index]["time"].toDate()).toString()}"
                                      // snapshot.data!.docs[index]["time"].toString()
                                      ,
                                      style: TextStyle(color: fontOnC),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle:
                                      StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                        style: TextStyle(color: fontOffC),
                                        text:
                                        "Pickup Point: ${snapshot.data!.docs[index]["from"]}",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    // Positioned(
                                    //   top: 17,
                                    //   right: 15,
                                    //   child:
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                            : Container(),
                        checkPage == true &&
                            snapshot.data!.docs[index]["status"] ==
                                "completed"
                            ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8),
                          child: GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Ride is Completed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              // Get.to(RidePage(
                              //   name: snapshot.data!.docs[index]["name"],
                              //   des: snapshot.data!.docs[index]["to"],
                              //   pic: snapshot.data!.docs[index]["from"],
                              //   date: snapshot.data!.docs[index]["time"]
                              //       .toDate(),
                              //   num: snapshot.data!.docs[index]["phone"],
                              //   pickUpLoc: GeoPoint(
                              //     snapshot.data!.docs[index]["fromLoc"]
                              //         .latitude,
                              //     snapshot.data!.docs[index]["fromLoc"]
                              //         .longitude,
                              //   ),
                              //   dropDownLoc: GeoPoint(
                              //     snapshot.data!.docs[index]["toLoc"]
                              //         .latitude,
                              //     snapshot.data!.docs[index]["toLoc"]
                              //         .longitude,
                              //   ),
                              //   totalPrice: snapshot.data!.docs[index]
                              //       ["totalFare"],
                              //   uid: snapshot.data!.docs[index].id,
                              // ));
                              // print(snapshot.data!.docs[index].id);
                            },
                            child:  Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),

                              // width: Get.width / 1.15,
                              // height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Date:${DateFormat.yMMMd().add_jm().format(snapshot.data!.docs[index]["time"].toDate()).toString()}"
                                      // snapshot.data!.docs[index]["time"].toString()
                                      ,
                                      style: TextStyle(color: fontOnC),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle:
                                      StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                        style: TextStyle(color: fontOffC),
                                        text:
                                        "Pickup Point: ${snapshot.data!.docs[index]["from"]}",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    // Positioned(
                                    //   top: 17,
                                    //   right: 15,
                                    //   child:
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                            : Container(),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
