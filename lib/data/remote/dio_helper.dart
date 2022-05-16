
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    _dio = Dio(
        BaseOptions(
          baseUrl: 'https://qevents-test.appclouders.com/api/employee/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data ,
    String? token
  }) async
  {
    _dio!.options.headers =
    {
      'Authorization': token,
    };
    return await _dio!.get(url!, queryParameters: query,);
  }


  static Future<Response> postData({
    @required String? url ,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? token

  }) async
  {
    _dio!.options.headers =
    {
      'Authorization': token ,
    }
    ;

    return await _dio!.post(url!, queryParameters: query, data: data);
  }


  static Future<Response> putData({
    @required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,


  }) async
  {
    return await _dio!.put(url!, queryParameters: query, data: data);
  }

}
//


//baseUrl : https://..../
//method : { url : v/? }
//query : key = value & country = kl