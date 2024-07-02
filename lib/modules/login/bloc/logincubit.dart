import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/usermodel.dart';
import 'package:shop_app/modules/login/bloc/loginstates.dart';
import 'package:shop_app/screens/homescreen.dart';
import 'package:shop_app/shared/constants/constants.dart';
import 'package:shop_app/shared/helpers/cashhelper.dart';
import 'package:shop_app/shared/helpers/diohelper.dart';

class LoginCubit extends Cubit<LoginSatas> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userData;

  void UserLogin(
      {required BuildContext context,
      required String email,
      required dynamic password}) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
        url: 'login',
        data: {"email": email, "password": password}).then((value) {
      if (value.data['status']) {
        emit(SucessfullLoginState());
        userData = UserModel.fromJson(value.data['data']);
        token=userData!.token!;
        CashHelper.setData(key: "token", value: userData!.token).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Success"),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
        
      } else {
        emit(FailedLoginState(
            error: "please enter valid data (error in email or Password)"));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("(inccorrect Email or Password)"),
          backgroundColor: Colors.red,
        ));
      }
    }).catchError((error) {
      emit(FailedLoginState(error: error.toString()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ));
    });
  }
}
