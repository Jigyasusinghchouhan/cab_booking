import 'package:flutter/material.dart';
import 'package:cab_booking_user/CreateAccount.dart';
import 'package:cab_booking_user/HomeScreen.dart';
import 'package:cab_booking_user/Methods.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'OtpAuth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: size.width / 1.2,
                child: IconButton(
                    onPressed: () {Get.back();}, icon: Icon(Icons.arrow_back_ios))),
            SizedBox(
              height: size.height / 50,
            ),
            Container(
              width: size.width / 1.3,
              child: Text(
                "Welcome to MiCab",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: size.width / 1.3,
              child: Text(
                "Sign In to start riding!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 12,
            ),
            Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "email", Icons.account_box, _email)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock, _password),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            customButton(size),

            SizedBox(
              height: size.height / 20,
            ),

            GestureDetector(
              onTap: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CreateAccount())),
              child: Text("Create Account",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(otpauth());
                },
                child: Text(
                  "Login with otp",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Sucessfull");
              setState(() {
                isLoading = false;
              });
              Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              print("Login Failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please fill form correctly");
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.orangeAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }


  Widget field(Size size, String hintText, IconData icon,
      TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
