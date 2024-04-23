
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/onboarding/login/bloc/loginstates.dart';
import 'package:shop_app/shared/helpers/diohelper.dart';

class LoginCubit extends Cubit<LoginSatas> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void sendData({required String email, required dynamic password}) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
        url: 'login',
        data: {"email": email, "password": password}).then((value) {
          if(value.data['status']){
              emit(SucessfullLoginState());
          }else{
            emit(FailedLoginState(error: "please enter valid data (error in email or Password)"));
          }
    }).catchError((error) {
      emit(FailedLoginState(error: error.toString()));
      print("Error is ${error.toString()}");
    });
  }
}
