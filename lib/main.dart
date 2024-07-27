import 'package:api_pixbay/Pixbay/Provider/Api_Provider.dart';
import 'package:api_pixbay/Pixbay/View/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>HomeProvider(),
      builder:(context,child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

