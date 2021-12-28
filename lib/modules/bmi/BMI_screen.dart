// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing_app/modules/bmi_results/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = false;
  double Height = 100;
  int Weight = 50;
  int Age = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          //First Container
          Expanded(
              child: Container(
            // color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  //Left Side
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          color: isMale ? Colors.blue : Colors.black12,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  //right side
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.black12 : Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),

          //Second Container
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    "${Height.round()}",
                    style: TextStyle(fontSize: 45.0, color: Colors.white),
                  ),
                  Slider(
                    value: Height,
                    min: 0,
                    max: 200,
                    onChanged: (value) {
                      setState(() {
                        Height = value;
                      });
                    },
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green),
              // color: Colors.blue,
            ),
          )),

          //Third Container
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            "${Weight}",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Weight++;
                                  });
                                },
                                heroTag: 'weight',
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Weight--;
                                  });
                                },
                                heroTag: 'weight',
                                child: Icon(Icons.remove),

                                mini: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.redAccent),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            "${Age}",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                                heroTag: 'age+',
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Age--;
                                  });
                                },
                                heroTag: 'age-',
                                child: Icon(Icons.remove),
                                mini: true,
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          )),

          //Last Container
          Container(
            width: double.infinity,
            color: Colors.deepOrange,
            child: MaterialButton(
              onPressed: () {
                double result = Weight / pow(Height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (Context) => BMIResultScreen(
                      isMale: '${isMale ? 'Male' : 'female'}',
                      Result: result.round(),
                      Age: Age,
                    ),
                  ),
                );
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white),
              ),
              height: 70,
            ),
          )
        ],
      ),
    );
  }
}
