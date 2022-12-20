import 'package:flutter/material.dart';

class TrendingIconModel {
  String icon;
  String title;
  VoidCallback onPress;

  TrendingIconModel(
      {required this.icon, required this.onPress, required this.title});
}
