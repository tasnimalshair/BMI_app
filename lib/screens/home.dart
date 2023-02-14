import 'package:bmi/screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Body Mass Index',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m1Expanded(context, 'male'),
                  SizedBox(width: 20),
                  m1Expanded(context, 'female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightVal.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'cm',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Slider(
                        min: 90,
                        max: 220,
                        value: heightVal,
                        onChanged: (newValue) {
                          setState(() {
                            heightVal = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m2Expanded(context, 'weight'),
                  SizedBox(width: 20),
                  m2Expanded(context, 'age'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Result(result, isMale, age);
                    }));
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )),
            ),
          ),
        ],
      )),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = type == 'male' ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type == 'male'
                ? Icon(Icons.male, size: 90)
                : Icon(Icons.female, size: 90),
            SizedBox(height: 20),
            Text(
              type == 'male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    ));
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'weight' ? 'Weight' : 'Age',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            type == 'age' ? '$age' : '$weight',
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () {
                  setState(() {
                    type == 'age' ? age-- : weight--;
                  });
                },
                child: Icon(Icons.remove),
                mini: true,
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () {
                  setState(() {
                    type == 'age' ? age++ : weight++;
                  });
                },
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
