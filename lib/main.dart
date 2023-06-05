import 'package:flutter/material.dart';
import 'package:recipe_app/app.dart';

void main() async {
  await Future.delayed(Duration(seconds: 5));
  runApp(const App());
}