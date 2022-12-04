import 'package:cab_booking_user/HomeScreen.dart';
import 'package:cab_booking_user/cancel.dart';
import 'package:cab_booking_user/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({required this.carType,required this.dateTime,required this.fare});

  final String carType;
  final String dateTime;
  final String fare;

  @override
  Widget build(BuildContext context) {
    var appHeadingTitle;

    return Scaffold(
          appBar: AppBar(
            title: Text(carType),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: myData(Data: 'Booking Details'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.width / 6, right: Get.width / 6),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        details(deta: 'Ride Type', detb: 'Dropping'),
                        details(deta: 'Car Type', detb: carType),
                        details(deta: 'From', detb: locate.value.pickUp),
                        details(deta: 'To', detb: locate.value.pickUpFrom),
                        details(deta: 'Distance', detb:" Distance: $totalDistanceRoundOff KM"),
                        details(deta: 'Date/Time', detb: dateTime),
                        details(deta: 'Total fare', detb: fare),

                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: myData(
                      Data: "Passenger Details",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.width / 6, right: Get.width / 6),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ),

                  /*margin:EdgeInsets.all(10) ,
                          child:Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  hintText: 'name'
                              ),
                              ),
                    ),*/
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What do people call you?',
                        labelText: 'Name *',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'optional?',
                        labelText: 'Email *',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                  ),

                  Expanded(
                    flex: 2,

                    //height: 60.0,
                    //color: Colors.white,
                    // child: Text('Button '),

                    child: Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: GestureDetector(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("bookings")
                              .add({
                            "RideType": "Dropping",
                            "status":"pending",
                            "phone":box.read("phone"),
                            "CarType": carType,
                            "From":locate.value.pickUpFrom,
                            "To":locate.value.pickUp,
                            "fromLoc": GeoPoint(
                                calLocation.value.pickUpFromLat, calLocation.value.pickUpFromLag),
                            "toLoc": GeoPoint(
                                calLocation.value.pickUpLat,calLocation.value.pickUpLag),
                            "Distance":totalDistanceRoundOff,
                            "userDate":dateTime,
                            "TotalFare":fare,
                            "timeNow": DateTime.now(),
                          }).then((value) => {     Fluttertoast.showToast(
                          msg: "Cab Booking done successfully \nOur Driving executive will contact you soon..",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                          ),});

                          Get.offAll(Cancel());

                        },
                        child: Container(

                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color: Colors.black),
                          // elevation :30.0,
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),

                          child: Center(child: Text('Book',style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ),

                  ),


                  // ],
                ],
              ),
            ),
          ));


  }

  myData({String? Data}) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${Data!}",
              style: TextStyle(
                  color: new Color(0xff622F74),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
          ),
        ),
      ],
    );
  }

  details({String? deta, String? detb}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: Text(
              deta!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "-",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: Text(
              detb!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
