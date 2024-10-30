import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/constants/constants.dart';

class WebService {
  static WebService? _this;

  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  String lang = 'en';
  String? myToken;
  final String storageKeyMobileToken = 'Authorization';

  WebService._() {
    freeDio.options.connectTimeout = const Duration(milliseconds: 300);
    freeDio.options.baseUrl = Constants.domain;

    tokenDio.options.connectTimeout = const Duration(milliseconds: 300);
    tokenDio.options.baseUrl = Constants.domain;
    _initializeTokenDioInterceptor();
  }

  void _initializeTokenDioInterceptor() {
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint(
              'send request : BaseURL:${options.baseUrl} path:${options.path}');
          debugPrint('headers:${options.headers}');
          debugPrint('query parameters:${options.queryParameters}');
          debugPrint('data:${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('statusCode: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          log(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('error: ${e.error}');
          debugPrint('message: ${e.message}');
          debugPrint('type: ${e.type}');
        },
      ),
    );

    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (myToken != null) {
            options.headers[storageKeyMobileToken] = "Bearer $myToken";
          }
          debugPrint('Token request - path:${options.path}');
          debugPrint('headers:${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('Token response - statusCode: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          debugPrint('Token error - statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('error: ${e.error}');
          debugPrint('message: ${e.message}');
          debugPrint('type: ${e.type}');
        },
      ),
    );
  }
}
