import 'package:flutter/material.dart';
import 'package:sawahku/src/home/profile/account.dart';
import 'package:sawahku/src/home/profile/field.dart';
import 'package:sawahku/src/home/profile/user_profle.dart';
import 'package:sawahku/src/user_auth/login_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      const UserProfile(),
      Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.075,
              vertical: MediaQuery.of(context).size.height * 0.025),
          child: Column(children: <Widget>[
            Account(),
            Field(),
            TextButton(
                onPressed: () {
                  signout();
                },
                child: Text(
                  "Keluar",
                  style: TextStyle(color: Colors.redAccent[400]),
                ))
          ]))
    ]));
  }
}
