import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;
  String get resultPhrase {
    String phr = '';
    if (result >= 30)
      phr = 'Obese';
    else if (result > 25 && result < 30)
      phr = 'Overweight';
    else if (result > 18.5 && result < 24.9)
      phr = 'Normal';
    else
      phr = 'Thin';

    return phr;
  }

  Result(this.result, this.isMale, this.age);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Result',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1),
            Text('Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline1),
            Text(
              'Healthiness: $resultPhrase',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text('Age: $age', style: Theme.of(context).textTheme.headline1),
          ],
        ),
      )),
    );
  }
}
