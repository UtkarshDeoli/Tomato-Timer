import 'package:flutter/material.dart';

const kbackgroundDark = Color(0xff1f1b23);
const kcolor2 = Color(0xff664eff);
const kcolor3 = Color(0xff6c4eb3);

double getWidth(context, double min) {
  double x;
  if (MediaQuery.of(context).size.width < min) {
    x = MediaQuery.of(context).size.width;
  } else {
    x = min;
  }
  return x;
}

double getHeight(context, double min) {
  double x;
  if (MediaQuery.of(context).size.height < min) {
    x = MediaQuery.of(context).size.height;
  } else {
    x = min;
  }
  return x;
}
