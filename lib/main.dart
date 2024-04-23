import 'package:flutter/material.dart';
import 'package:shop_app/modules/onboarding/onboarding.dart';
import 'package:shop_app/shared/helpers/diohelper.dart';

void main() {
  DioHelper.init();
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App ',
      
      home: Onboarding(),
    );
  }
}
