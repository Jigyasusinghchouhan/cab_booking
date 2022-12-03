import 'package:cargo_driver/widgets/colorset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

aBar({required ico,required Color icoColor,required bool tIcoPre,tIco,String ?title}) {

  return AppBar(
    title: Text(title ?? "",style: TextStyle(color: fontOnC),),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        ico,
        color: icoColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    actions: [
      tIcoPre?IconButton(
        icon: Icon(
          tIco,
          color: icoColor,
        ),
        onPressed: () {
          Get.back();
        },
      ):Container(),
    ],
  );
}
