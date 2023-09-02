import 'package:firebase_database/firebase_database.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref('prediksi/');

void upDateValue(num price, num area, num urea, num age) async {
  num harga = price;
  num luas = area;
  num pupuk = urea;
  num umur = age;
  await ref.update({
    "harga": harga,
    "luas": luas,
    "pupuk": pupuk,
    "umur": umur,
  });
}
