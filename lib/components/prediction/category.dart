import 'package:flutter/material.dart';

class SuccessIndicator extends StatefulWidget {
  const SuccessIndicator({Key? key}) : super(key: key);

  @override
  State<SuccessIndicator> createState() => _SuccessIndicatorState();
}

class _SuccessIndicatorState extends State<SuccessIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          StatusIndicator(status: "120%", title: "Melimpah", bold: true),
          StatusIndicator(status: "100%", title: "Berhasil"),
          StatusIndicator(status: "60%", title: "Sedang"),
          StatusIndicator(status: "40%", title: "Kurang"),
          StatusIndicator(status: "20%", title: "Tinggi"),
        ],
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  final String title;
  final String status;
  final bool bold;
  const StatusIndicator(
      {Key? key, this.title = "", this.status = "", this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: bold ? Colors.green : Colors.grey,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w500),
        ),
        Text(
          status,
          style: TextStyle(
              color: bold ? Colors.black : Colors.grey,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w500),
        )
      ],
    );
  }
}
