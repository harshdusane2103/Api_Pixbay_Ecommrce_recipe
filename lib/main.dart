
import 'package:api_pixbay/Recipe/Provider/provider_recipe.dart';
import 'package:api_pixbay/Recipe/View/Recipe_Home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (context)=>RecipesProvider(),),
    ],

      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        routes: {
          '/':(context)=>RecipeHomeScreen(),
        },
      ),
    );
  }
}

