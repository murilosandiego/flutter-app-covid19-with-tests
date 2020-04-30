import 'dart:convert';

import '../exceptions/server_exception.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

import '../constants/api_constants.dart';
import 'interfaces/api_helper_interface.dart';

class APIDioHelper implements IAPIHelper {
  final Dio dio;

  APIDioHelper({@required this.dio}) {
    _initApiClient();
  }

  void _initApiClient() {
    dio
      ..options.headers.addAll({'parameter': 'parameter'})
      // ..interceptors.add(logInterceptor)
      ..options.baseUrl = BASE_URL;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      return options;
    }, onResponse: (Response response) async {
      return response;
    }, onError: (DioError e) async {
      return e;
    }));
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - GET] Server Response: $res');

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - GET] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw ServerException(e.response.data);

      throw ServerException(e.message);
    }
  }

  Future<dynamic> post(String url,
      {Map headers, @required body, encoding}) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      final response =
          await dio.post(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw ServerException(e.response.data);

      throw ServerException(e.message);
    }
  }
}
