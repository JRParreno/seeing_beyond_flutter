import 'package:flutter/material.dart';

Color hexToColors(String colorCode) {
  String color = colorCode.replaceAll('#', '0xff');

  return Color(int.parse(color));
}
