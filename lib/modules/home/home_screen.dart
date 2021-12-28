import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                print("Welcome");
              },
              icon: Icon(Icons.access_alarm_outlined))
        ],
      ),

      body: Column(
        children: [
            Container(
              width: double.infinity,
              height: 100.0,
              color: Colors.amber,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'mohsen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Text(
                    'mohamed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              )
            ),
          // Expanded(
          //   child: Container(
          //     height: 100.0,
          //     color: Colors.amber,
          //     child: Text(
          //       'mohsen',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 30.0,
          //         backgroundColor: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     height: 100.0,
          //     color: Colors.amber,
          //     child: Text(
          //       'mohsen',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 30.0,
          //         backgroundColor: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  HomeScreen();
}
