
import 'package:api_pixbay/Ecommrce/Provider/Ecommrce_Provider.dart';
import 'package:api_pixbay/Ecommrce/View/ECO_Home.dart';
import 'package:api_pixbay/Recipe/Provider/provider_recipe.dart';


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
        create: (context)=>EcommerceProvider(),),
    ],

      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        routes: {
          '/':(context)=>ProductHomescreen(),
        },
      ),
    );
  }
}

