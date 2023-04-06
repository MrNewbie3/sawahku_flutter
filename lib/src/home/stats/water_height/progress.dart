import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class ProgressWheels extends StatefulWidget {
  const ProgressWheels({Key? key}) : super(key: key);

  @override
  State<ProgressWheels> createState() => _ProgressWheelsState();
}

class _ProgressWheelsState extends State<ProgressWheels> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: .0),
        child: Center(
            child: Column(children: [
          const Text(
            "Ketinggian Air",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          CircularStepProgressIndicator(
              totalSteps: 75,
              arcSize: math.pi * 2,
              currentStep: 20,
              selectedColor: const Color.fromRGBO(85, 198, 247, 1),
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
                      child: Icon(Icons.water_drop_rounded,
                          size: MediaQuery.of(context).size.height * 0.15,
                          color: const Color.fromRGBO(85, 198, 247, 1))))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text("25%",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
        ])));
  }
}
