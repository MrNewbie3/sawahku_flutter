import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/src/page/activity_page/fetch.dart';

class NewActivity extends StatefulWidget {
  const NewActivity({Key? key}) : super(key: key);

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  num umur = 0;
  num luas = 0;
  num harga = 0;
  num pupuk = 0;
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
            title:
                const Text("Data Sawah", style: TextStyle(color: Colors.black)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_rounded, color: Colors.black))),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: ListView(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.025),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (state) {
                                        var currentValue = int.parse(state);
                                        umur = currentValue;
                                      },
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Umur Tanaman (hari)',
                                          prefixIcon:
                                              Icon(CupertinoIcons.arrow_swap))),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (state) {
                                        var currentValue = int.parse(state);
                                        luas = currentValue;
                                      },
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Luas Tanah (m\u00b2)',
                                          prefixIcon: Icon(Icons.public))),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (state) {
                                        var currentValue = int.parse(state);
                                        harga = currentValue;
                                      },
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Harga (Rp)',
                                          prefixIcon:
                                              Icon(Icons.sell_outlined))),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (state) {
                                        var currentValue = int.parse(state);
                                        pupuk = currentValue;
                                      },
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Pemupukan (kali)',
                                          prefixIcon:
                                              Icon(Icons.backpack_outlined))),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.375),
                                  TextButton(
                                      onPressed: () {
                                        upDateValue(harga, luas, pupuk, umur);
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.greenAccent[700])),
                                      child: const Center(
                                          child: Text("Tambahkan",
                                              style: TextStyle(color: Colors.white))))
                                ]))
                      ])
                ]))));
  }
}
