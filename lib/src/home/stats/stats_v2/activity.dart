import 'package:flutter/material.dart';

class ActivityUser extends StatefulWidget {
  const ActivityUser({Key? key}) : super(key: key);

  @override
  State<ActivityUser> createState() => _ActivityUserState();
}

class _ActivityUserState extends State<ActivityUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Aktivitas Terakhir",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text("Lihat semua",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.greenAccent[700]))
              ]),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 80.0,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                activityDetails(context, Icons.backpack_outlined, "Pemupukan",
                    "2 Hari yang lalu"),
                activityDetails(
                    context, Icons.water, "Pengairan", "7 Hari yang lalu"),
                activityDetails(context, Icons.healing_rounded, "Perawatan",
                    "23 Maret 2023")
              ]))
        ]));
  }
}

Container activityDetails(
    context, IconData icons, String activity, String time) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 145,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(icons, color: Colors.greenAccent[700]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(activity,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black)),
                      Text(time,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(125, 125, 125, 1)))
                    ])
              ])));
}
