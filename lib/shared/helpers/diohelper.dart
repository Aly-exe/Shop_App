import 'package:dio/dio.dart';
import 'package:shop_app/shared/constants/constants.dart';

class DioHelper {
  static Dio dio =Dio();

  static void init() async {
    dio = await Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {"lang": "en", "Content-Type": "application/json","Authorization":token}));
  }

  static Future<Response> postData(
      {required String url, required Map data}) async {
    return await dio.post(url, data: data);
  }

  static Future<Response> getData(String url) async {
    dio.options.headers={
      "lang":"en",
      "Content-Type":"application/json",
      "Authorization":token
    };
    return await dio.get("https://student.valuxapps.com/api/$url");
  }
}
