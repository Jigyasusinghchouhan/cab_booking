import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

textF({Icon ?icon,required String lName, String ?hName,required TextEditingController controllers,Icon ?sIcon,bool ?numberShow,bool ?foc,bool ?pad,}){
  return
    Padding(
      padding:EdgeInsets.all(pad==true?0.0:18.0),
      child:
      TextFormField(
        keyboardType: numberShow==true?TextInputType.number:null,
        autofocus: foc??false,
        controller: controllers,

        validator: (value) {
          if (value!.isEmpty)
            return  'This field cannot be empty';
          return null;
        },
        // onSaved: (value) =>
        // nameEditor = value.toString(),
        decoration: InputDecoration(

          icon: icon,
          hintText: hName,
          labelText: lName,
          suffixIcon: sIcon,

        ),
      ),

    );
}
