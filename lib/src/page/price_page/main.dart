import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PricePrediction extends StatefulWidget {
  const PricePrediction({Key? key}) : super(key: key);

  @override
  State<PricePrediction> createState() => _PricePredictionState();
}

class _PricePredictionState extends State<PricePrediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .5,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text("Prediksi Harga",
            style: const TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline_rounded, color: Colors.black))
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 13,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    color: const Color.fromRGBO(0, 0, 0, .06))
              ]),
              padding:
                  const EdgeInsets.symmetric(horizontal: (16), vertical: 8),
              child: Row(children: <Widget>[
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Cari',
                          prefixIcon: const Icon(Icons.search_rounded))),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.tune_rounded))
              ])),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Terakhir Dilihat"),
                        Container(
                            height: 100,
                            padding: const EdgeInsets.only(top: 24.0),
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const <Widget>[
                                  RecentlyViews(
                                      date: '2 hari yang lalu', name: 'Padi'),
                                  RecentlyViews(
                                      date: '2 hari yang lalu', name: 'Padi')
                                ]))
                      ])),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Semua Bahan"),
                  ),
                  PriceCondition(),
                  PriceCondition(),
                  PriceCondition(),
                  PriceCondition(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class PriceCondition extends StatelessWidget {
  const PriceCondition({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.125,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage('https://random.imagecdn.app/500/150'),
                        backgroundColor: Colors.transparent),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Padi",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Oryza Sativa",
                            style: TextStyle(color: Colors.grey),
                          )
                        ])
                  ]),
              Column(
                children: <Widget>[
                  Text("Rp 14.000,-"),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.greenAccent[700],
                      ),
                      Text(
                        "2000",
                        style: TextStyle(color: Colors.greenAccent[700]),
                      )
                    ],
                  )
                ],
              )
            ]));
  }
}

class RecentlyViews extends StatelessWidget {
  const RecentlyViews({Key? key, required this.name, required this.date})
      : super(key: key);
  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-16, 0, 0),
      width: 200,
      child: ListTile(
        leading: const CircleAvatar(
            radius: 30.0,
            backgroundImage:
                NetworkImage('https://via.placeholder.com/150', scale: 3),
            backgroundColor: Colors.transparent),
        title: Text(name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        subtitle: Text(date, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}

Container plantInfo(context) {
  return Container(
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.abc, color: Colors.greenAccent[700]),
            SizedBox(
              width: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Padi",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black)),
                  Text("Oryza Sativa",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(125, 125, 125, 1)))
                ])
          ]));
}
