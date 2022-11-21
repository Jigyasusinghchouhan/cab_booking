import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({required this.carType,});
final String carType;
  @override
  Widget build(BuildContext context) {
    var appHeadingTitle;

    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
            title: Text('Mini'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  myData(Data: 'Booking Details'),

                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width / 6, right: Get.width / 6),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  details(deta: 'Ride Type',detb:'Dropping' ),
                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('Car Type -'),
                  ),

                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('From -'),
                  ),

                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('To -'),
                  ),

                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('Distance -'),
                  ),

                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('Date/Time -'),
                  ),

                  Container(
                    height: 40.0,
                    color: Colors.white,
                    child: Text('Total fare -'),
                  ),
                  myData(
                    Data: "Passenger Details",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width / 6, right: Get.width / 6),
                    child: Divider(
                      thickness: 2,
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
                  TextFormField(
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

                  TextFormField(
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

                  Container(
                    //height: 60.0,
                    //color: Colors.white,
                    // child: Text('Button '),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  color: Colors.cyan),
                              // elevation :30.0,
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),

                              child: Center(child: Text('Button')),
                            ),
                          ),
                        )),
                  ),

                  // ],
                ],
              ),
            ),
          )),
    );


  }

  details({String? deta, String? detb}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: const Text('Ride Type'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text("-"),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: const Text('Dropping'),
          ),
        ),
      ],
    );
  }
  myData({String ?Data, int ?vals}){
    print(vals.toString());
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${Data!}",
              style:
              TextStyle(
                  color:new Color(0xff622F74),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),

            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(vals.toString()!="null"?vals.toString():"",
              style:
              TextStyle(
                  color:new Color(0xff622F74),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),

            ),
          ),
        ),

      ],
    );
  }
}