import 'package:flutter/material.dart';
import 'package:sawahku/components/prediction/category.dart';
import 'package:sawahku/components/prediction/plant.dart';
import 'package:sawahku/components/prediction/plant_res.dart';
import 'package:sawahku/components/prediction/price_predict.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);
  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline_rounded,
                      color: Colors.black))
            ],
            centerTitle: true,
            elevation: .5,
            title: const Text("Perkiraan Panen",
                style: TextStyle(color: Colors.black)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_rounded, color: Colors.black))),
        body: SafeArea(
            child: ListView(children: const <Widget>[
          Plant(),
          SuccessIndicator(),
          ResultPrediction(),
          ResultPricePrediction()
        ])));
  }
}
