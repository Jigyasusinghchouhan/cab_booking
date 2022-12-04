import 'package:cab_booking_user/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

Future<User?> createAccount(String name, String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user= (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    if(user !=null){
      print("Login Successful");
      return user;
    }
    else{
      print("Account Creation failed");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user= (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    if(user != null){
      print("Login Successfull");
      return user;
    }
    else{
      print("Login Failed");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}