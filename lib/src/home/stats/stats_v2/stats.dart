import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StatsFields extends StatefulWidget {
  const StatsFields({Key? key}) : super(key: key);

  @override
  State<StatsFields> createState() => _StatsFieldsState();
}

class _StatsFieldsState extends State<StatsFields> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  num height = 0;
  num ph = 0;
  void _getData() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('Sawahkita').onValue.listen((event) {
      var value = event.snapshot;
      setState(() {
        ph = value.child('ph').value as num;
        height = value.child('tinggiair').value as num;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Wrap(
            spacing: 10.0, // gap between adjacent chips
            runSpacing: 10.0, // gap between lines
            children: <Widget>[
              widgetContainer(context, "Tinggi Air", "$height cm",
                  Icons.water_drop_outlined, Colors.blue),
              widgetContainer(context, "pH Air", "$ph pH",
                  Icons.medication_outlined, Colors.blue),
              widgetContainer(context, "Umur", "89 Hari", Icons.eco_outlined,
                  Colors.greenAccent[700]),
              widgetContainer(context, "Pengairan", "6 Kali", Icons.water,
                  Colors.greenAccent[700]),
              widgetContainer(context, "Pemupukan", "3 Kali",
                  Icons.backpack_outlined, Colors.greenAccent[700]),
              widgetContainer(context, "Pestisida", "2 Kali",
                  Icons.pest_control_outlined, Colors.greenAccent[700]),
              widgetContainer(context, "Perawatan", "4 Kali",
                  Icons.healing_rounded, Colors.greenAccent[700]),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.285,
                      height: 145,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[700],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.13),
                                blurRadius: 13,
                                offset: Offset(0, 5),
                                spreadRadius: 0)
                          ]),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(String.fromCharCode(Icons.add.codePoint),
                                    style: TextStyle(
                                        inherit: false,
                                        color: Colors.white,
                                        fontSize: 40,
                                        package: Icons.add.fontPackage,
                                        fontFamily: Icons.add.fontFamily,
                                        fontWeight: FontWeight.w100)),
                                const Text("Tambah \nAktivitas",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white))
                              ]))))
            ]));
  }
}

Container widgetContainer(
    context, String text, String value, IconData icons, Color? colors,
    [Color backgroundColor = Colors.white]) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.285,
      height: 145,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.13),
                blurRadius: 13,
                offset: Offset(0, 5),
                spreadRadius: 0)
          ]),
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(String.fromCharCode(icons.codePoint),
                    style: TextStyle(
                        inherit: false,
                        color: colors,
                        fontSize: 40,
                        package: icons.fontPackage,
                        fontFamily: icons.fontFamily,
                        fontWeight: FontWeight.w100)),
                Text(text,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(125, 125, 125, 1)))
              ])));
}
