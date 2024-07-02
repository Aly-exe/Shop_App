import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homemodel.dart';
import 'package:shop_app/modules/categories/categories.dart';
import 'package:shop_app/modules/favourite/favourite.dart';
import 'package:shop_app/modules/products/products.dart';
import 'package:shop_app/modules/products/productsblocstates.dart';
import 'package:shop_app/modules/settings/settings.dart';
import 'package:shop_app/shared/constants/constants.dart';
import 'package:shop_app/shared/helpers/diohelper.dart';

class ProductsBloc extends Cubit<ProductStates> {
  ProductsBloc() : super(InitialProductState());
  static ProductsBloc get(context) => BlocProvider.of(context);

  int currenindex = 2;
  List<Widget> AppScreens = [
    ProductsScreen(),
    FavouriteScreen(),
    CategoriesScreen(),
    SettingsScreen()
  ];
  HomeModel? homeData;

  void changeCurrentindex(index) {
    currenindex = index;
    emit(AppScreenState());
  }

  Future<void> getProductData() async {
    emit(LoadingGetProductState());
    // await Dio().get("${baseUrl}home").then((value) {
    //   log("Success");
    //   homeData = HomeModel.fromJson(value.data);
    //   log('Ali is ${value.data.toString()}');
    //   emit(successGetProductState());
    // }).catchError((error) {
    //   emit(FailedGetProductState(error: error.toString()));
    // });

    DioHelper.getData("home").then((value) {
      homeData = HomeModel.fromJson(value.data);
      log('success');
      log(homeData!.status.toString());
      emit(successGetProductState());
    }).catchError((error) {
      emit(FailedGetProductState(error: error.toString()));
    });
  }
}
