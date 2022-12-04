// import 'package:cargo_driver/datacheck.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class CalenderPage extends StatefulWidget {
//   const CalenderPage({Key? key}) : super(key: key);
//
//   @override
//   State<CalenderPage> createState() => _CalenderPageState();
// }
//
// class _CalenderPageState extends State<CalenderPage> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//
//   DateTime _focusedDay = DateTime.now();
//
//   DateTime? _selectedDay;
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       firstDay: DateTime.utc(2010, 10, 16),
//       lastDay: DateTime.utc(2030, 3, 14),
//       focusedDay: DateTime.now(),
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         setState(() {
//           _selectedDay = selectedDay;
//           _focusedDay = focusedDay; // update `_focusedDay` here as well
//         });
//         print(_selectedDay);
//         Get.to(DataCheck(day: _selectedDay!.day,month: _selectedDay!.month,year:  _selectedDay!.year,));
//       },
//     );
//   }
// }
