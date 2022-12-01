import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vpns.dart';

class otpauth extends StatefulWidget {
  const otpauth({Key? key}) : super(key: key);

  @override
  State<otpauth> createState() => _otpauthState();
}

class _otpauthState extends State<otpauth> {
  TextEditingController countryController= TextEditingController();
  @override
  void initState(){
    countryController.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/mapdemo.jpg',
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    // SizedBox(
                    //   width: 40,
                    //   child: TextField(
                    //     controller: countryController,
                    //     maxLength: 10,
                    //     keyboardType: TextInputType.number,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //     ),
                    //   ),
                    // ),
                    // Text(
                    //   "|",
                    //   style: TextStyle(fontSize: 33, color: Colors.grey),
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          controller: countryController,
                          maxLength: 13,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {

                      Get.to(VerifyPhoneNumberScreen(
                        phoneNumber: countryController.text,));

                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}