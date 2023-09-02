import 'package:flutter/material.dart';

class Plant extends StatefulWidget {
  const Plant({Key? key}) : super(key: key);

  @override
  State<Plant> createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
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
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1635562985686-4f8bb9c0d3bf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmljZSUyMGZpZWxkfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
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
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
                          )
                        ])
                  ]),
              TextButton(
                onPressed: (() {}),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "Ganti",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]));
  }
}
