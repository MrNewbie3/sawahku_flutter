// ignore_for_file: non_constant_identifier_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/separator.dart';
import '../utils/space_between_text.dart';

class ResultPrediction extends StatefulWidget {
  const ResultPrediction({Key? key}) : super(key: key);
  @override
  State<ResultPrediction> createState() => _ResultPredictionState();
}

class _ResultPredictionState extends State<ResultPrediction> {
  @override
  void initState() {
    _getPrediction();
    super.initState();
  }

  num price = 0;
  num res = 0;
  num area = 0;
  num predictVal = 0;
  num urea = 0;
  num age = 0;

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
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.075,
            horizontal: MediaQuery.of(context).size.height * 0.04),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Prediksi Hasil Panen",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              DataInformation("Luas Tanah", "$area m"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
              DataInformation("Tingkat Keberhasilan", "$predictVal%"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
              const MySeparator(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
              DataInformation("Hasil Panen", "$res kg", weight: FontWeight.w600)
            ]));
  }
}
