// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/src/auth/user_auth/login_auth.dart';
import 'package:sawahku/src/auth/user_auth/signin_comps.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;
  IconData icon = Icons.visibility;
  String phoneNumber = '';
  String password = '';
  Color primaryGreen = Color.fromRGBO(13, 187, 87, 1);

  void _setPhoneNumber(String input) {
    setState(() {
      phoneNumber = input;
    });
  }

  void _setPassword(String input) {
    setState(() {
      password = input;
    });
  }

  void _setObscurePass() {
    setState(() {
      obscure ? obscure = false : obscure = true;
      icon == Icons.visibility
          ? icon = Icons.visibility_off
          : icon = Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: ListView(children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Masuk",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700)),
                          StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.userChanges(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Text(
                                      "Masukkan nomor telepon dan kata sandi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                              125, 125, 125, 1)));
                                }
                                return Text('${snapshot.data?.phoneNumber}');
                              }),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.085),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            onChanged: ((value) {
                              _setPhoneNumber(value);
                            }),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Nomor Telepon',
                                hintText: 'cth: +6285xxxxxxxx1',
                                prefixIcon: Icon(Icons.phone_outlined)),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: obscure,
                              onChanged: (value) {
                                _setPassword(value);
                              },
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Kata Sandi',
                                  prefixIcon: Icon(Icons.lock_open_rounded),
                                  suffixIcon: IconButton(
                                      onPressed: () => {_setObscurePass()},
                                      icon: Icon(icon)))),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                          TextButton(
                              onPressed: () {
                                phoneNumberLogin(phoneNumber, context);

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             MainHomePageLayouts()));
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryGreen)),
                              child: Center(
                                  child: Text("Masuk",
                                      style: TextStyle(color: Colors.white)))),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Belum punya akun?",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 125, 125, 1))),
                                TextButton(
                                    onPressed: () {
                                      userState();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()),
                                      );
                                    },
                                    child: Text("Daftar"))
                              ])
                        ]))
              ])
            ])));
  }
}
