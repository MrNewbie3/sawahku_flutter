// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sawahku/src/home/stats/water_height/information.dart';
import 'package:sawahku/src/home/stats/water_height/progress.dart';
import 'package:sawahku/src/home/stats/water_ph/information.dart';
import 'package:sawahku/src/home/stats/water_ph/progress.dart';
import 'package:sawahku/src/home/stats/weather/information.dart';
import 'package:sawahku/src/home/stats/weather/progress.dart';

class WaterStatsComp extends StatefulWidget {
  const WaterStatsComp({Key? key}) : super(key: key);
  @override
  State<WaterStatsComp> createState() => _WaterStatsCompState();
}

class _WaterStatsCompState extends State<WaterStatsComp> {
  int index = 0;
  List<Color> activeColor = [
    Color.fromRGBO(13, 187, 87, 1),
    Color.fromRGBO(211, 211, 211, 1),
    Color.fromRGBO(211, 211, 211, 1),
  ];
  void _setIndex(index) {
    setState(() {
      this.index = (index);
      // ignore: avoid_print
      for (var i = 0; i < activeColor.length; i++) {
        i == this.index
            ? activeColor[i] = Color.fromRGBO(13, 187, 87, 1)
            : activeColor[i] = Color.fromRGBO(211, 211, 211, 1);
      }
    });
  }

  List<Widget> indicator = [
    ProgressWheels(),
    ProgressWheelsPh(),
    ProgressWheelsWeather()
  ];

  List<Widget> status = [
    InforamtionStatus(),
    InforamtionStatusPH(),
    InforamtionStatusWeather(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(
                child: Column(children: [
              indicator[index],
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      indicator.length,
                      (index) => IconButton(
                          onPressed: () {
                            _setIndex(index);
                          },
                          icon: Icon(Icons.eco, color: activeColor[index])))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              status[index]
            ]))));
  }
}
