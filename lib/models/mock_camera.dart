import 'package:flutter/material.dart';

Widget MockCameraWidget() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Colors.deepOrange, Colors.orange],
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: AspectRatio(
                    aspectRatio: 1 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.black, width: 5.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue,
                              Colors.purple
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.black, width: 25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 25,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 5.0)),
                child: Center(
                  child: Container(color: Colors.black, height: 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
