abstract class LoginSatas {}
class InitialLoginState extends LoginSatas{}
class LoginLoadingState extends LoginSatas{}
class SucessfullLoginState extends LoginSatas{}
class FailedLoginState extends LoginSatas{
  String? error;
  FailedLoginState({required this.error});
}