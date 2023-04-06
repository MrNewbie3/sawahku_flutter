// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class InforamtionStatusWeather extends StatefulWidget {
  const InforamtionStatusWeather({Key? key}) : super(key: key);

  @override
  State<InforamtionStatusWeather> createState() =>
      _InforamtionStatusWeatherState();
}

class _InforamtionStatusWeatherState extends State<InforamtionStatusWeather> {
  List<Widget> icons = [
    Icon(Icons.cloud_outlined, color: Color.fromRGBO(13, 187, 87, 1), size: 30),
    Icon(Icons.water_drop_outlined,
        color: Color.fromRGBO(13, 187, 87, 1), size: 30),
    Icon(Icons.arrow_forward_rounded,
        color: Color.fromRGBO(13, 187, 87, 1), size: 30)
  ];
  List<String> value = ["33\u2103 ", "31%", '25 Km/h'];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
                child: Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.035,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: 125,
                            decoration: BoxDecoration(
                                color: Colors.white,
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
                                        MediaQuery.of(context).size.height *
                                            0.02),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      icons[index],
                                      Text(value[index],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  125, 125, 125, 1)))
                                    ]))))))));
  }
}
