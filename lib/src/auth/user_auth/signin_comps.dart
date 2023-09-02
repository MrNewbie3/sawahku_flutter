// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sawahku/src/auth/user_auth/login_comps.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureConfirm = true;
  IconData iconConfirm = Icons.visibility;
  bool obscure = true;
  IconData icon = Icons.visibility;
  Color primaryGreen = Color.fromRGBO(13, 187, 87, 1);
  void _setObscureConfirmField() {
    setState(() {
      obscureConfirm ? obscureConfirm = false : obscureConfirm = true;
      iconConfirm == Icons.visibility
          ? iconConfirm = Icons.visibility_off
          : iconConfirm = Icons.visibility;
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
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                                      icon: Icon(icon)))),
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
                                      icon: Icon(Icons.visibility)))),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryGreen)),
                              child: Center(
                                  child: Text("Daftar",
                                      style: TextStyle(color: Colors.white)))),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Sudah punya akun?",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 125, 125, 1))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                    child: Text("Masuk"))
                              ])
                        ]))
              ])
            ])));
  }
}
