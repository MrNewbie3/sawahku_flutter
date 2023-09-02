import 'package:flutter/material.dart';

Container widgetContainer(
    context, String text, String value, IconData icons, Color? colors,
    [Color backgroundColor = Colors.white]) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.285,
      height: 145,
      decoration: BoxDecoration(
          color: backgroundColor,
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
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(String.fromCharCode(icons.codePoint),
                    style: TextStyle(
                        inherit: false,
                        color: colors,
                        fontSize: 40,
                        package: icons.fontPackage,
                        fontFamily: icons.fontFamily,
                        fontWeight: FontWeight.w100)),
                Text(text,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(125, 125, 125, 1)))
              ])));
}

GestureDetector navigationStats(
    context, String text, IconData icon, Color? colors, pages) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pages;
        }));
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.285,
          height: 145,
          decoration: BoxDecoration(
              color: colors,
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
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(String.fromCharCode(icon.codePoint),
                        style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 40,
                            package: icon.fontPackage,
                            fontFamily: icon.fontFamily,
                            fontWeight: FontWeight.w100)),
                    Text(text,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                        textAlign: TextAlign.center)
                  ]))));
}

Container wideContainer(context, String text, String value, Color? colors,
    [Color backgroundColor = Colors.white]) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.59,
      height: 145,
      decoration: BoxDecoration(
          color: backgroundColor,
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
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Penyebab",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        Text(text,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(125, 125, 125, 1))),
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Solusi",
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      Text(value,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(125, 125, 125, 1)))
                    ],
                  )
                ]),
          )));
}
