import 'package:flutter/material.dart';

selectButton({
  required String msg,
  Color? boxCol,
  double? hei,
  double? wid,
  bool? fontCen,
  Color? fontCol,
  FontWeight? fontW,
  double? fontS,
  bool? fontAlg,

}) {
  return Center(
    child: Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: boxCol,
      ),
      height: hei,
      width: wid,
      child:fontCen == true ? Center(
        child: Text(
          msg,
          style: TextStyle(
            color: fontCol,
            fontWeight: fontW,
            fontSize: fontS,
          ),
          textAlign:fontAlg==true?TextAlign.center:TextAlign.start,
        ),
      ):Text(
        msg,
        style: TextStyle(
          color: fontCol,
          fontWeight: fontW,
          fontSize: fontS,
        ),
        textAlign:fontAlg==true?TextAlign.center:TextAlign.start,
      ),
    ),
  );
}
