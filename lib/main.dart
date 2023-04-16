import 'package:flutter/material.dart';
// import 'package:location_based_reminder/Notify/notify_page.dart';
// import 'package:location_based_reminder/Reminder/reminder.dart';
import 'package:location_based_reminder/Screens/Notify/notify_page.dart';
import 'package:location_based_reminder/Screens/Reminder/reminder.dart';
import 'package:location_based_reminder/Screens/home/screen_home.dart';
// import 'package:location_based_reminder/home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:HomeScreen() ,
      routes:{
        'notify_home':(ctx){
          return Notify();
        },
        'reminder_home':(ctx){
          return Reminder();
        },
      } ,
    );
  }
}

// class HomeScreen extends StatefulWidget {
//    HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _textController=TextEditingController();

//   String _displayText='Initial text'; 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       // appBar: AppBar(),
//       body: SafeArea(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//             Expanded(
//               child: Container(
//                   color: Colors.greenAccent,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Hemanth',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white54,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                               onPressed: () {
//                                 print('Button Clicked');
//                               },
//                               child: Text('Click ME')),
//                           IconButton(
//                               onPressed: () {
//                                 print('ICon click');
//                               },
//                               icon: Icon(Icons.mic))
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           print('ele btn clicked');
//                         },
//                         child: Text('Click ME'),
//                       ),
//                     ],
//                   )),
//             ),
//             Expanded(
//               child:Container(
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10.0),
//                   border:Border.all(
//                     color: Colors.white70,
//                     width:14,
//                   ) 

//                 ),
//               child:Padding(
//                 padding: EdgeInsets.all(20),
//               child:Column(

//                 children: [
//                   TextField(
//                     controller: _textController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Type Something'
//                     ),
//                   ),
//                   ElevatedButton(onPressed:(){
//                       //get data
//                       // print(_textController.text);
//                       setState(() {
//                         _displayText=_textController.text;
//                       });
                     
//                   }, child: Text('Submit')),
//                   Text(_displayText),

//                 ],
//               ) ,
//               )
//               ),
              
//             ),

//             Expanded(
//               child: Container(
//                   color: Colors.orange,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Hemanth',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white54,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                               onPressed: () {
//                                 print('Button Clicked');
//                               },
//                               child: Text('Click ME')),
//                           IconButton(
//                               onPressed: () {
//                                 print('ICon click');
//                               },
//                               icon: Icon(Icons.mic))
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           print('ele btn clicked');
//                         },
//                         child: Text('Click ME'),
//                       ),
//                     ],
//                   )),
//             )
//           ])),
//     );
//   }
// }
