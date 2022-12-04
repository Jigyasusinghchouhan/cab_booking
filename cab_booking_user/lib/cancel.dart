import 'package:cab_booking_user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cancel extends StatelessWidget {
  const Cancel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        Get.offAll(HomeScreen());
        },
        label: const Text('Cancel Booking'),
        icon: const Icon(Icons.cancel),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Otp will arrive soon.Please provide the otp to the driver."),),
          SizedBox(height: 100,),
          // Container(
          //   decoration: ShapeDecoration(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(18.0),
          //       ),color: Colors.red
          //   ),
          //   child:const Padding(
          //     padding:  EdgeInsets.all(8.0),
          //     child: Text("Cancel Booking",style: TextStyle(color: Colors.white),),
          //   ),),
        ],
      ),
    );
  }
}
