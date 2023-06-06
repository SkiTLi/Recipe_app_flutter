import 'package:flutter/material.dart';
import 'package:recipe_app/app.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 5));
  runApp(const App());
}
