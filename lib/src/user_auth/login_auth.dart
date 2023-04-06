import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sawahku/src/splash_screen/splash.dart';

void userState() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
    } else {}
  });
}

signout() async {
  await FirebaseAuth.instance.signOut();
  return const SplashScreen();
}

void phoneNumberLogin(String phoneNumber, context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (phoneNumber.length < 10) {
    throw Error();
  }
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) async {
      // ANDROID ONLY!
      // Sign the user in (or link) with the auto-generated credential
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    codeSent: (String verificationId, int? resendToken) async {
      String? smsCode = await askingSMSCode(context);
      if (smsCode != null) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        try {
          auth.signInWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          showNotification(context, e.message.toString());
        }
      } else {
        showNotification(context, "Code must not be null");
      }
    },
    verificationFailed: (FirebaseAuthException error) {
      showNotification(context, error.message.toString());
    },
  );
}

void showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green.shade900,
      content: Text(message.toString())));
}

Future<String?> askingSMSCode(BuildContext context) async {
  return await showDialog<String>(
      context: context,
      builder: (_) {
        TextEditingController controller = TextEditingController();

        return SimpleDialog(
            title: const Text('Please enter the SMS code sent to you'),
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                color: const Color.fromARGB(255, 240, 240, 240),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.green,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'SMS Code'),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, controller.text);
                  },
                  child: Text('Confirm',
                      style: TextStyle(color: Colors.green.shade900)))
            ]);
      });
}
