import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/bloc/logincubit.dart';
import 'package:shop_app/modules/products/producstbloc.dart';
import 'package:shop_app/modules/products/productsblocstates.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ProductsBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mega Store"),
          ),
          body: cubit.AppScreens[cubit.currenindex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            elevation: 10,
            onTap: (index) {
              cubit.changeCurrentindex(index);
            },
            currentIndex: cubit.currenindex,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffFCFFFC),
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffFCFFFC),
                  icon: Icon(
                    Icons.grid_view_sharp,
                    
                  ),
                  label: "Categories"),
              BottomNavigationBarItem(
                backgroundColor: Color(0xffFCFFFC),
                icon: Icon(
                  Icons.favorite_outlined,
                ),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xffFCFFFC),
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
