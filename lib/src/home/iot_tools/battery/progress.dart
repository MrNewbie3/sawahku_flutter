import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressPump extends StatefulWidget {
  const ProgressPump({Key? key}) : super(key: key);

  @override
  State<ProgressPump> createState() => _ProgressPumpState();
}

class _ProgressPumpState extends State<ProgressPump> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Baterai",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      CircularStepProgressIndicator(
          totalSteps: 75,
          arcSize: math.pi * 2,
          currentStep: 8,
          selectedColor: const Color.fromRGBO(255, 58, 58, 1),
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
                            offset:
                                const Offset(0, 3) // changes position of shadow
                            )
                      ],
                      borderRadius: BorderRadius.circular(200)),
                  child: Icon(Icons.battery_1_bar_rounded,
                      size: MediaQuery.of(context).size.height * 0.15,
                      color: const Color.fromRGBO(255, 58, 58, 1))))),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      const Text("8%",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
    ]);
  }
}
