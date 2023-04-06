// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sawahku/src/home/stats/water_status.dart';

class MainStats extends StatefulWidget {
  const MainStats({Key? key}) : super(key: key);
  @override
  State<MainStats> createState() => _MainStatsState();
}

class _MainStatsState extends State<MainStats> {
  List<Widget> leafIcon = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: WaterStatsComp());
  }
}
