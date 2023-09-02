import 'package:firebase_database/firebase_database.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref('Sawah2/');

void setPump(bool value) async {
  await ref.update({"pompauser": value});
}
