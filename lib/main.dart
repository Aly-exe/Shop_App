import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/loginscreen.dart';
import 'package:shop_app/modules/products/producstbloc.dart';
import 'package:shop_app/screens/homescreen.dart';
import 'package:shop_app/shared/helpers/cashhelper.dart';
import 'package:shop_app/shared/helpers/diohelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CashHelper.initCashHelper();
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..getProductData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App ',
        home: HomeScreen(),
      ),
    );
  }
}
