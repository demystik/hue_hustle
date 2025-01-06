import 'package:flutter/material.dart';
import 'dart:math';

class HueHustle extends StatefulWidget {
  const HueHustle({super.key});

  @override
  State<HueHustle> createState() => _HueHustleState();
}

void setBackgroundColor(){

}

class _HueHustleState extends State<HueHustle> {

  double currentValue = 1;
  Color _color = Colors.white;
  int randomNumber = 0;


  // To set Background color
  void setBackgroundColor (double currentValue, int randomNumber){
    setState(() {
      _color = Color.fromARGB(250, 
      currentValue.truncate() + randomNumber, 
      (currentValue / 3).truncate() + 20,
      currentValue.truncate() - randomNumber,
      );
    });
  }

  // To update slider value and send random number
  void sliderSet(value){
    setState(() {
      currentValue = value;
    });
      randomNumber = Random().nextInt(20) + 30; // Value is >= 0 and < 20.
      setBackgroundColor(currentValue, randomNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _color,
        appBar: AppBar(
          title: const Center(child: Text('HueHustle')),
        ),
        body: Container(
          // color: const Color.fromARGB(255, 112, 43, 43),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white.withAlpha(32),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withAlpha(100),
                    width: 1,
                  )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      // activeColor: Colors.blue,
                      // inactiveColor: Colors.grey,
                      // thumbColor: Colors.white,
                      divisions: 235,
                      min: 0.0,
                      max: 235.0,
                      label: currentValue.toStringAsFixed(2),
                      value: currentValue, 
                    onChanged: (value) => sliderSet(value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
