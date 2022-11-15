import 'package:flutter/material.dart';
import 'package:cab_booking_user/Methods.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String dateB = "0";
  bool roundSwitch = false;
  bool dateSwitch = false;
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cab Book"),
        centerTitle: true,
        backgroundColor:Colors.green,
        elevation :0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30),
            Text(
              "From:",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 10),
Padding(
  padding: const EdgeInsets.only(left: 18.0,right: 18.0),
  child:   Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [



      Text("Please provide us your location" ),

      Icon(Icons.my_location_rounded),

    ],

  ),
),

            const SizedBox(height: 20),
            Text(
              "Destination:",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18.0),
              child:   Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [



                  Text("select your destination" ),

                  Icon(Icons.my_location_rounded),

                ],

              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/2.5),
            Text(
              'Pickup Date:',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
                            now.hour , now.minute, 00),
                        onChanged: (date) {},
                        onConfirm: (date) {
                          setState(() {
                            dateB =
                            "${date.day}-${date.month}-${date.year} | ${date.hour} : ${date.minute}";

                            dateSwitch = true;
                          });
                        },
                        currentTime: DateTime(now.year, now.month, now.day,
                            now.hour , now.minute, 00));
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
                      style:
                      TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                        : Text(
                      dateB,
                      style:
                      TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(10.5),
                  child: Text(
                    "Select Cab",
                    style: TextStyle(color: Colors.white, fontSize: 25),
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