import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InforamtionStatus extends StatefulWidget {
  const InforamtionStatus({Key? key}) : super(key: key);

  @override
  State<InforamtionStatus> createState() => _InforamtionStatusState();
}

class _InforamtionStatusState extends State<InforamtionStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.13),
                      blurRadius: 23,
                      offset: Offset(0, 5),
                      spreadRadius: 0)
                ]),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text("Batas Air",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        CircularStepProgressIndicator(
                            totalSteps: 100,
                            currentStep: 25,
                            padding: 0,
                            selectedColor: const Color.fromRGBO(13, 187, 87, 1),
                            unselectedColor:
                                const Color.fromRGBO(211, 211, 211, 1),
                            selectedStepSize: 10.0,
                            unselectedStepSize: 10.0,
                            width: MediaQuery.of(context).size.width * .18,
                            height: MediaQuery.of(context).size.height * .09),
                        Column(children: const <Widget>[
                          Text("2",
                              style: TextStyle(
                                  color: Color.fromRGBO(13, 187, 87, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                          Text("Meter",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ])
                      ]),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.03,
                    thickness: 1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.energy_savings_leaf_rounded,
                            color: Color.fromRGBO(13, 187, 87, 1)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Masih dalam batas aman",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 125, 125, 1)))
                      ])
                ]))));
  }
}
