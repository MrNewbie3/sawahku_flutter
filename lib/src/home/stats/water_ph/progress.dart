import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class ProgressWheelsPh extends StatefulWidget {
  const ProgressWheelsPh({Key? key}) : super(key: key);

  @override
  State<ProgressWheelsPh> createState() => _ProgressWheelsPhState();
}

class _ProgressWheelsPhState extends State<ProgressWheelsPh> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  num ph = 0;
  num percentage = 0;
  void getData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('Sawahkita/ph').onValue.listen((event) {
      final Object? rawVal = event.snapshot.value;
      setState(() {
        ph = rawVal as num;
        percentage = (ph) / 14 * 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: .0),
        child: Center(
            child: Column(children: [
          const Text(
            "PH Air",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          CircularStepProgressIndicator(
              totalSteps: 75,
              arcSize: math.pi * 2,
              currentStep: (percentage / 100 * 75).floor().toInt(),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("PH",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(125, 124, 125, 1))),
                            Icon(Icons.water_drop_rounded,
                                size:
                                    MediaQuery.of(context).size.height * 0.075,
                                color: const Color.fromRGBO(85, 198, 247, 1)),
                          ])))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text('${ph.toString()} pH',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
        ])));
  }
}
