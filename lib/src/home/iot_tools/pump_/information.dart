import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/src/home/iot_tools/pump_/pump_data.dart';

class InformationBattery extends StatefulWidget {
  const InformationBattery({Key? key}) : super(key: key);

  @override
  State<InformationBattery> createState() => _InformationBatteryState();
}

class PumpStatus {
  bool status = false;
  String onPump = "";
}

class _InformationBatteryState extends State<InformationBattery> {
  var status = PumpStatus();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('Sawahkita/pompa').onValue.listen((event) {
      final Object? description = event.snapshot.value;
      setState(() {
        status.status = description as bool;
        status.status
            ? status.onPump = "Pompa air menyala!"
            : status.onPump = "Pompa air mati";
      });
    });
  }

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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text("Saklar",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        Switch(
                            activeColor: const Color.fromRGBO(13, 187, 87, 1),
                            value: status.status,
                            onChanged: (bool value) {
                              setPump(value);
                              setState(() {
                                status.status = value;
                                status.status
                                    ? status.onPump = "Pompa air menyala!"
                                    : status.onPump = "Pompa air mati";
                              });
                            })
                      ]),
                  Divider(
                      height: MediaQuery.of(context).size.height * 0.03,
                      thickness: 1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.energy_savings_leaf_rounded,
                            color: Color.fromRGBO(13, 187, 87, 1)),
                        const SizedBox(width: 20),
                        Text(status.onPump,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(125, 125, 125, 1)))
                      ])
                ]))));
  }
}
