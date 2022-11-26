import 'package:flutter/material.dart';

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
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'OTP verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please enter your mobile number to get started.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),
            Container(
              height: 55,
              decoration:
              BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                    child: TextField(
                      controller: countryController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Text("|",
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  SizedBox(
                    width:10,
                  ),
                  Expanded(child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone"
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
