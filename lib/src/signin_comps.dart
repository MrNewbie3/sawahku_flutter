// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureConfirm = true;
  bool obscure = true;
  void _setObscureConfirmField() {
    setState(() {
      obscureConfirm == true ? obscureConfirm = false : obscureConfirm = true;
    });
  }

  void _setObscurePass() {
    setState(() {
      obscure == true ? obscure = false : obscure = true;
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_backspace_rounded, size: 40)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Daftar",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700)),
                          Text("Silahkan buat akun terlebih dahulu",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(125, 125, 125, 1))),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.085),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Nama Lengkap',
                                prefixIcon: Icon(Icons.person_outlined)),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
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
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Kata Sandi',
                                prefixIcon: Icon(Icons.lock_open_rounded),
                                suffixIcon: IconButton(
                                    onPressed: () => {_setObscurePass()},
                                    icon: Icon(Icons.remove_red_eye_rounded))),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: obscureConfirm,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Konfirmasi Kata Sandi',
                                prefixIcon: Icon(Icons.lock_open_rounded),
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        {_setObscureConfirmField()},
                                    icon: Icon(Icons.remove_red_eye_rounded))),
                          ),
                        ])),
              ])
            ])));
  }
}
