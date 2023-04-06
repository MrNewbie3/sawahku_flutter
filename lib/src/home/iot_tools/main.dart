import 'package:flutter/material.dart';
import 'package:sawahku/src/home/iot_tools/pump_/information.dart';
import 'package:sawahku/src/home/iot_tools/pump_/progress.dart';
import 'package:sawahku/src/home/iot_tools/battery/information.dart';
import 'package:sawahku/src/home/iot_tools/battery/progress.dart';

class IotTools extends StatefulWidget {
  const IotTools({Key? key}) : super(key: key);
  @override
  State<IotTools> createState() => _IotToolsState();
}

class _IotToolsState extends State<IotTools> {
  int index = 0;
  List<Color> activeColor = const [
    Color.fromRGBO(13, 187, 87, 1),
    Color.fromRGBO(211, 211, 211, 1),
    Color.fromRGBO(211, 211, 211, 1),
  ];

  List<Widget> indicator = const [ProgressBattery()];
  List<Widget> status = const [InformationBattery()];
  @override
  void initState() {
    super.initState();
    _reloadState();
  }

  void _reloadState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(
                child: Column(children: [
              indicator[0],
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              status[0]
            ]))));
  }
}
