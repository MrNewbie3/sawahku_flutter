import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class ProgressWheelsWeather extends StatefulWidget {
  const ProgressWheelsWeather({Key? key}) : super(key: key);

  @override
  State<ProgressWheelsWeather> createState() => _ProgressWheelsWeatherState();
}

class _ProgressWheelsWeatherState extends State<ProgressWheelsWeather> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: .0),
        child: Center(
            child: Column(children: [
          const Text("Prakiraan Cuaca",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          CircularStepProgressIndicator(
              totalSteps: 75,
              arcSize: math.pi * 2,
              currentStep: 20,
              selectedColor: const Color.fromRGBO(58, 102, 186, 1),
              unselectedColor: const Color.fromRGBO(211, 211, 211, 1),
              selectedStepSize: 15.0,
              unselectedStepSize: 15.0,
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .3,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.09),
                                spreadRadius: 26,
                                blurRadius: 91,
                                offset: const Offset(
                                    0, 99) // changes position of shadow
                                ),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.09),
                                spreadRadius: -1,
                                blurRadius: 12,
                                offset: const Offset(
                                    0, 3) // changes position of shadow
                                )
                          ],
                          borderRadius: BorderRadius.circular(200)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_rounded,
                                size: MediaQuery.of(context).size.height * 0.15,
                                color: const Color.fromRGBO(58, 102, 186, 1)),
                            Container(
                                transform: Matrix4.translationValues(
                                    0,
                                    -(MediaQuery.of(context).size.height *
                                        0.025),
                                    0),
                                child: Icon(Icons.electric_bolt_rounded,
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
                                    color:
                                        const Color.fromRGBO(255, 220, 123, 1)))
                          ])))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text("40%",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
        ])));
  }
}
