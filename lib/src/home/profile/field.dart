import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  const Field({Key? key}) : super(key: key);

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Sawah", style: TextStyle(fontSize: 16)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.grid_view,
                    color: Colors.grey[700],
                  ),
                  Text("Sawah 1", style: TextStyle(color: Colors.grey[700])),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Colors.grey[700])
                ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.grid_view,
                    color: Colors.grey[700],
                  ),
                  Text("Sawah 2", style: TextStyle(color: Colors.grey[700])),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Colors.grey[700])
                ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.grid_view,
                    color: Colors.grey[700],
                  ),
                  Text("Sawah 3", style: TextStyle(color: Colors.grey[700])),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Colors.grey[700])
                ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.dashboard_customize_outlined,
                    color: Colors.greenAccent[700],
                  ),
                  Text(
                    "Tambah Sawah",
                    style: TextStyle(color: Colors.greenAccent[700]),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Colors.greenAccent[700])
                ])
          ]),
    );
  }
}
