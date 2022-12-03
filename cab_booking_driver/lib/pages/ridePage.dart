import 'package:cab_booking_driver/components/colorset.dart';
import 'package:cab_booking_driver/pages/driverMap.dart';
import 'package:cab_booking_driver/widgets/appbar.dart';
import 'package:cab_booking_driver/widgets/selectbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RidePage extends StatelessWidget {
  const RidePage(
      {required this.name,
        required this.date,
        required this.des,
        required this.num,
        required this.pic,
        required this.pickUpLoc,
        required this.dropDownLoc,
        required this.totalPrice,
        required this.uid,
        Key? key})
      : super(key: key);
  final String name;
  final String date;
  final String num;
  final String pic;
  final String des;
  final GeoPoint pickUpLoc;
  final GeoPoint dropDownLoc;
  final String totalPrice;
  final String uid;
  tableBox({
    required String label,
    required String val,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, top: 18, bottom: 18),
                  child: Text(
                    label,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    val,
                    style: const TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: aBar(
          ico: Icons.arrow_back_ios_rounded,
          icoColor: Colors.black,
          tIcoPre: true),
      body: ListView(
        children: <Widget>[
          const Center(
              child: Text(
                "Ride Information",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          const Divider(
            thickness: 1,
          ),
          SizedBox(height: 50),
          tableBox(label: "Name:", val: name),
          tableBox(label: "Date/Time:", val:
          date),
          tableBox(label: "Pickup Point:", val: pic),
          tableBox(label: "Destination:", val: des),
          tableBox(label: "Number:", val: num),

          // DataTable(
          //   columns: const [
          //     DataColumn(
          //         label: Text('Date:',
          //             style: TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold))),
          //     DataColumn(
          //         label: Text('Time:',
          //             style: TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold))),
          //     DataColumn(
          //         label: Text('Pickup:',
          //             style: TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold))),
          //   ],
          //   rows: const [
          //     DataRow(cells: [
          //       DataCell(Text('12/11/22')),
          //       DataCell(Text('12:45 PM')),
          //       DataCell(Text('Pun/Kot')),
          //     ]),
          //   ],
          // ),
          SizedBox(
            height: Get.height / 5,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                print(uid);
                FirebaseFirestore.instance
                    .collection("bookings").doc(uid)
                    .update({
                  "status": "ongoing",
                });
                Get.to(DriveMap(date: date, fromLoc: pickUpLoc,

                  toLoc: dropDownLoc,uid: uid,));
              },
              child: selectButton(
                msg: "Start Ride",
                hei: 50,
                wid: Get.width / 1.4,
                boxCol: fontOffC,
                fontCol: fontWhiteC,
                fontCen: true,
                fontS: 24,
                fontW: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
