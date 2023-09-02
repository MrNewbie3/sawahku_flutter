import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressBattery extends StatefulWidget {
  const ProgressBattery({Key? key}) : super(key: key);

  @override
  State<ProgressBattery> createState() => _ProgressBatteryState();
}

class CurrentStatus {
  bool status = false;
}

class _ProgressBatteryState extends State<ProgressBattery> {
  var status = CurrentStatus();
  @override
  void initState() {
    super.initState();
    _getData();
    _waterData();
  }

  int current = 0;
  num height = 0;
  String text = '';
  Color currentColor = const Color.fromRGBO(13, 187, 87, 1);

  void _getData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('PaTani/pompa').onValue.listen((event) {
      final Object? description = event.snapshot.value;
      setState(() {
        status.status = description as bool;
        if (status.status) {
          current = 75;
          text = "ON";
          currentColor = const Color.fromRGBO(13, 187, 87, 1);
        } else {
          current = 0;
          text = "OFF";
          currentColor = const Color.fromRGBO(211, 211, 211, 1);
        }
      });
    });
  }

  void _waterData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('PaTani/tinggiair').onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        height = (val as num) / 3.2 * 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Pompa Air",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      CircularStepProgressIndicator(
          totalSteps: 75,
          currentStep: current,
          selectedColor: const Color.fromRGBO(13, 187, 87, 1),
          arcSize: math.pi * 2,
          unselectedColor: const Color.fromRGBO(211, 211, 211, 1),
          selectedStepSize: 15.0,
          unselectedStepSize: 15.0,
          width: 225,
          height: 225,
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
                  child: Center(
                      child: Text(text,
                          style: TextStyle(
                              color: currentColor,
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.15)))))),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Text("${height.ceil()}%",
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700))
    ]);
  }
}
