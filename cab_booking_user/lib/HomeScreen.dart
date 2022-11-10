import 'package:flutter/material.dart';
import 'package:cab_booking_user/Methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: Text("Home Screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => logOut(context),
          child: Text("Log Out",
          style: TextStyle(
            color:Colors.deepOrangeAccent,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }
}
