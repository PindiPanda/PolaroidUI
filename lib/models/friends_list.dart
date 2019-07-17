import 'package:flutter/material.dart';

Widget friendsList (){
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final row = MaterialButton(
          color: Colors.deepPurple,
          splashColor: Colors.deepOrange,
          highlightColor: Colors.deepOrange,
          onPressed: () {},
          elevation: 0.0,
          padding: EdgeInsets.all(0.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/image_03.jpg'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bob The Hedgehog',
                        style: TextStyle(
                          inherit: false,
                          fontFamily: 'Nothing You Could Do',
                          fontSize: 27.0,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        'I am Mountain Bob!!!',
                        style: TextStyle(
                          inherit: false,
                          fontFamily: 'Nothing You Could Do',
                          fontSize: 18.0,
                        ),
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, right: 15.0),
                        child: Container(
                          height: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        return row;
      },
      childCount: 10,
    ),
  );
}
