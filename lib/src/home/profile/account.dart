import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      const Text("Akun", style: TextStyle(fontSize: 16)),
      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Icon(Icons.language, color: Colors.grey[700]),
        Text(
          "Pilihan Bahasa",
          style: TextStyle(color: Colors.grey[700]),
        ),
        Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.grey[700])
      ]),
      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Icon(Icons.help, color: Colors.grey[700]),
        Text(
          "Bantuan dan Pusat Panggilan",
          style: TextStyle(color: Colors.grey[700]),
        ),
        Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.grey[700])
      ])
    ]);
  }
}
