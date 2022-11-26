// import 'dart:collection';
//
// import 'package:flutter/material.dart';
//
// class CabBook extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     var appHeadingTitle;
//
//     return  Scaffold(
//           appBar: AppBar(
//             title: Text('Mini'),
//             centerTitle: true,
//             backgroundColor: Colors.green,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   myData(Data: 'Booking Details',vals: 5),
//                   // Container(
//                   //    child: TextField(
//                   //
//                   //    ),
//                   //   padding: EdgeInsets.all(1),
//                   //  ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0,right: 8.0),
//                     child: Divider(thickness: 1,),
//                   ),
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child:const Text('Ride Type -'),
//                   ),
//
//
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('Car Type -'),
//                   ),
//
//                   /*Container(
//                     child: TextField(
//
//                     ),
//                     padding: EdgeInsets.all(0.1),
//                   ),*/
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('From -'),
//                   ),
//
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('To -'),
//                   ),
//
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('Distance -'),
//                   ),
//
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('Date/Time -'),
//                   ),
//
//                   Container(
//                     height: 40.0,
//                     color: Colors.white,
//                     child: Text('Total fare -'),
//                   ),
//                   myData(Data:"Passenger Details",),
//
//                   Container(
//                       height: 30.0,
//                       color: Colors.white,
//                       child: Text('Name : ')
//                   ),
//                   /*margin:EdgeInsets.all(10) ,
//                           child:Column(
//                             children: <Widget>[
//                               TextField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Name',
//                                   hintText: 'name'
//                               ),
//                               ),
//                     ),*/
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.person),
//                       hintText: 'What do people call you?',
//                       labelText: 'Name *',
//                     ),
//                     onSaved: (String? value) {
//                       // This optional block of code can be used to run
//                       // code when the user saves the form.
//                     },
//                     validator: (String? value) {
//                       return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//                     },
//                   ),
//                   Container(
//                       height: 20.0,
//                       color: Colors.white,
//                       child: Text('Email : ')
//                   ),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       icon: Icon(Icons.person),
//                       hintText: 'optional?',
//                       labelText: 'Email *',
//                     ),
//                     onSaved: (String? value) {
//                       // This optional block of code can be used to run
//                       // code when the user saves the form.
//                     },
//                     validator: (String? value) {
//                       return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//                     },
//                   ),
//
//                   Container(
//                     //height: 60.0,
//                     //color: Colors.white,
//                     // child: Text('Button '),
//                     child: Center(
//                         child:Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child:
//
//                           GestureDetector(
//                             onTap: (){},
//                             child: Card(
//                               elevation :10.0,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//                               color:Colors.black,
//                               child:Text('Button'),
//
//
//                             ),
//                           ),
//                         )
//                     ),
//
//                   ),
//
//                   // ],
//
//                 ],
//               ),
//
//
//             ),
//           )
//       );
//
//
//   }
//   myData({String ?Data, int ?vals}){
//     print(vals.toString());
//     return Column(
//       children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text("${Data!}",
//               style:
//               TextStyle(
//                   color:new Color(0xff622F74),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30.0
//               ),
//
//             ),
//           ),
//         ),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(vals.toString()!="null"?vals.toString():"",
//               style:
//               TextStyle(
//                   color:new Color(0xff622F74),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30.0
//               ),
//
//             ),
//           ),
//         ),
//
//       ],
//     );
//   }
// }
//
