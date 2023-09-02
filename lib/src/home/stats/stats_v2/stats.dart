import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/components/stats/stats_comp.dart';
import 'package:sawahku/src/page/activity_page/main.dart';
import 'package:sawahku/src/page/prediction_price/main.dart';

class StatsFields extends StatefulWidget {
  const StatsFields({Key? key}) : super(key: key);

  @override
  State<StatsFields> createState() => _StatsFieldsState();
}

class _StatsFieldsState extends State<StatsFields> {
  @override
  void initState() {
    _getData();
    _getPrediction();
    super.initState();
  }

  num height = 0;
  num tempt = 0;
  num humidity = 0;
  num price = 0;
  num res = 0;
  num area = 0;
  num predictVal = 0;
  num urea = 0;
  num age = 0;

  void _getData() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('PaTani').onValue.listen((event) {
      var value = event.snapshot;
      setState(() {
        height = value.child('tinggiair').value as num;
        tempt = value.child('suhu').value as num;
        humidity = value.child('kelembapan').value as num;
      });
    });
  }

  void _getPrediction() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('');
    starCountRef.child('prediksi').onValue.listen((event) {
      var value = event.snapshot;
      setState(() {
        price = value.child("harga").value as num;
        res = value.child("hasil").value as num;
        area = value.child("luas").value as num;
        predictVal = value.child("predict").value as num;
        urea = value.child("pupuk").value as num;
        age = value.child("umur").value as num;
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
              widgetContainer(context, "Status", "gagal",
                  CupertinoIcons.circle_fill, Colors.red),
              wideContainer(
                  context, "Banjir", "sedot air dengan pompa", Colors.blue),
              widgetContainer(context, "Lembab", "$humidity%",
                  Icons.water_drop_outlined, Colors.blue),
              widgetContainer(context, "Tinggi Air", "$height cm",
                  Icons.water_rounded, Colors.blue),
              widgetContainer(context, "Suhu", "$tempt\u2103",
                  Icons.cloud_outlined, Colors.blue),
              widgetContainer(context, "Luas Tanah", "$area m\u00b2",
                  Icons.public, Colors.greenAccent[700]),
              GestureDetector(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Prediction();
                    }));
                  }),
                  child: widgetContainer(context, "Harga", "Rp $price",
                      Icons.sell_outlined, Colors.greenAccent[700])),
              widgetContainer(context, "Hasil Panen", "$res kg",
                  Icons.monetization_on_outlined, Colors.greenAccent[700]),
              widgetContainer(context, "Umur", "$age Hari",
                  CupertinoIcons.arrow_swap, Colors.greenAccent[700]),
              widgetContainer(context, "Pemupukan", "$urea Kali",
                  Icons.backpack_outlined, Colors.greenAccent[700]),
              navigationStats(
                  context,
                  "Data \n Sawah",
                  Icons.data_array_rounded,
                  Colors.greenAccent[700],
                  const NewActivity())
            ]));
  }
}
