import 'package:flutter/material.dart';

Widget Logo(String imgNmame) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(90.0),
      child: Image.asset(
        'assets/$imgNmame.png',
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      ));
}
