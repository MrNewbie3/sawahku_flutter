import 'package:flutter/material.dart';
import 'package:sawahku/src/home/stats/stats_v2/activity.dart';
import 'package:sawahku/src/home/stats/stats_v2/stats.dart';

class AllStats extends StatefulWidget {
  const AllStats({Key? key}) : super(key: key);

  @override
  State<AllStats> createState() => _AllStatsState();
}

class _AllStatsState extends State<AllStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            ListView(children: const <Widget>[StatsFields(), ActivityUser()]));
  }
}
