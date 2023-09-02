import 'package:flutter/material.dart';

Row DataInformation(String title, String value,
    {FontWeight weight = FontWeight.w400}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Text>[
      Text(
        title,
        style: TextStyle(fontWeight: weight),
      ),
      Text(
        value,
        style: TextStyle(fontWeight: weight),
      ),
    ],
  );
}
