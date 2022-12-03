import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'pages/homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),

      // Scaffold(
      //   body: Center(
      //     child: Lottie.asset('lot/car.json'),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}


