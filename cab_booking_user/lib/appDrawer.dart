
import 'package:cab_booking_user/Authenticate.dart';
import 'package:cab_booking_user/ColorSet.dart';
import 'package:cab_booking_user/faq.dart';
import 'package:cab_booking_user/global.dart';
import 'package:cab_booking_user/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: backGroundC,
        elevation: 1.5,
        child: Column(children: <Widget>[
          _createHeader(),
          Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // _createDrawerItem(
                  //   icon: Icons.history,
                  //   text: 'Ride History',
                  // ),
                  _createDrawerItem(
                      icon: Icons.question_answer_outlined,
                      text: 'FAQ',
                      onTap: (){
                        Get.to(FAQ());
                      }
                  ),
                  // _createDrawerItem(
                  //     icon: Icons.settings_applications, text: 'Setting'),
                  _createDrawerItem(text: 'V0.0.1', fontS: 17),
                ],
              )),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 0.1,
          ),
          Container(
            color: Colors.red,
            child: ListTile(
              title: Center(
                child: Text(
                  'LogOut',
                  style: TextStyle(color: fontWhiteC),
                ),
              ),
              onTap: () {
                box.remove('uid');
                Get.offAll( Authenticate());
              },
            ),
          ),
        ]));
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: AssetImage('assets/proback.jpg'),
      //   ),
      // ),
      child: GestureDetector(
        onTap: (){
          Get.to(Profile());
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  color: fontOffC,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "box.read(name)",
                  style: TextStyle(
                      color: fontOnC,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData? icon,
        required String text,
        GestureTapCallback? onTap,
        double? fontS}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: fontS ?? 20, color: fontOffC),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(icon),
        ],
      ),
      onTap: onTap,
    );
  }
}
