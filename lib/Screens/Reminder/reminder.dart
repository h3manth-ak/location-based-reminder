import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  // State<Reminder> createState() => _ReminderState();
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State<Reminder> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.black38,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');
                            },
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.greenAccent,
                                      ),
                                      Text(
                                        'Cheuthoni',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      'Buy beef',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 50),
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.white,
                                      activeTrackColor:
                                          Color.fromARGB(255, 30, 232, 8),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 40,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
