import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  // State<Notify> createState() => _NotifyState();
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State<Notify> {
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
      
      body:SafeArea(
          child: GridView.count(crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: List.generate(20, (index){
            return Container(
              child: Card(
                          color: Color.fromARGB(255, 39, 39, 39),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
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
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 19, top: 3),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.greenAccent,
                                            ),
                                            Text(
                                              'Malapuram',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
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
                                      'Vappa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 30, left: 40),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 K M',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Switch(
                                            onChanged: toggleSwitch,
                                            value: isSwitched,
                                            activeColor: Colors.white,
                                            activeTrackColor:
                                                Color.fromARGB(255, 30, 232, 8),
                                            inactiveThumbColor: Colors.white,
                                            inactiveTrackColor: Colors.grey,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
            );
          }),
          
      ),),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 15),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      print('hello notify');
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 45,
                    ),
                    splashColor: Colors.green,
                  ),
              ))
          ],
        ),
      ),
    );
  }
}
