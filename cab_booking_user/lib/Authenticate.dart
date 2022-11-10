import 'package:firebase_auth/firebase_auth.dart';
import 'package:cab_booking_user/HomeScreen.dart';
import 'package:cab_booking_user/LoginScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
 FirebaseAuth _auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser != null) {
      return HomeScreen();
    }
    else{
      return LoginScreen();
    }
  }
}
