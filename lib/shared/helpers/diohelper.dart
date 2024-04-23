import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio;

  static  void init()async{
    dio =await Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        headers: {
          "lang":"en",
          "Content-Type":"application/json"
        }
      )
    );
    
  }

static Future<Response> postData({required String url,required Map data}) async {
  return await dio!.post(
    url,
    data:data
  );
}
}