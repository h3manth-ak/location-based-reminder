import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Reached Kazargod',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
