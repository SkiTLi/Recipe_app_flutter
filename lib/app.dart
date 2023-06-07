import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/state/cart_state.dart';
import 'package:recipe_app/state/category_list/category_list_cubit.dart';
import 'screens/app_screen.dart';
import 'state/ingredient_list/ingredient_list_cubit.dart';
import 'state/recipe_list/recipe_random_list_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => RecipeRandomListCubit()),
        BlocProvider(create: (_) => IngredientListCubit()),
        BlocProvider(create: (_) => CategoryListCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Nunito'),
        // debugShowCheckedModeBanner: false, //true - with debugMode, or false - without
        home: AppScreen(),
      ),
    );
  }
}
