import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int Result;
  final String isMale;
  final int Age;

  BMIResultScreen({
    required this.isMale,
    required this.Result,
    required this.Age
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Gender: ${isMale}',
                style: TextStyle(fontSize: 25),
            ),
            Text(
              'Result: ${Result}',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Age: ${Age}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      )

    );
  }
}
