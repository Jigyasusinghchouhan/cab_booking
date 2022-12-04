import 'package:cab_booking_user/faq.dart';
import 'package:cab_booking_user/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: Get.width,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: Colors.white),
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ),
                Text(
                  box.read("name"),
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Get.to(FAQ());
            },
            child: Container(
              height: 80,
              width: Get.width / 1.2,
              color: Colors.black,
              child: Row(

                children:  [
                  const Expanded(
                      flex:5,
                      child: Center(child: Text("FAQ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),))),
                  Expanded(
                    flex:2,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        height: 40,
                        width: 40,
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      ),
                    ),
                  )
                ],),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              box.remove('uid');
              // Get.offAll(FrontPage());
            },
            child: Container(
              height: 80,
              width: Get.width / 1.2,
              color: Colors.red,
              child: Row(

                children:  [
                  const Expanded(
                      flex:5,
                      child: Center(child: Text("LogOut",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),))),
                  Expanded(
                    flex:2,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        height: 40,
                        width: 40,
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      ),
                    ),
                  )
                ],),
            ),
          ),
        ],
      ),
    );
  }
}
