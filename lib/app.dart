import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';

import 'screens/app_screen.dart';



class App extends StatelessWidget {
  const App({super.key});

    @override
  Widget build(BuildContext context) {
    return
      // BlocProvider(
      // create: (context) => TodoListCubit(),
      // child:
      MaterialApp(
        theme: ThemeData(fontFamily: 'Nunito'),
        // debugShowCheckedModeBanner: kDebugMode, //or false
        // debugShowCheckedModeBanner: false, //or false
        home: AppScreen(),
      // ),
    );
  }
}