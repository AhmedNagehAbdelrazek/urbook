import 'package:dio/dio.dart';
import 'package:urbook/core/services/web_service.dart';

abstract class AuthDataSource {
  Future<Response> login({required String email, required String password});
  Future<Response> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<Response> verfiyOtp({required String verfiyOtp});
  Future<Response> forgotPassword({required String email});
}

class AuthOnlineDataSource extends AuthDataSource {
  final Dio _dio;
  AuthOnlineDataSource(this._dio);
  final WebService _webService = WebService();
  @override
  Future<Response> login(
      {required String email, required String password}) async {
    return await _dio.post(
      "/api/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<Response> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    return await _dio.post(
      "/api/auth/signup",
      data: {
        "username": userName,
        "email": email,
        "password": password,
        "role": "user"
      },
    );
  }

  @override
  Future<Response> verfiyOtp({required String verfiyOtp}) async {
    return await _dio.post(
      "/api/auth/verfiyOtp",
      data: {
        "email": _webService.myEmail,
        "otp": verfiyOtp,
      },
    );
  }

  @override
  Future<Response> forgotPassword({required String email}) async {
    return await _dio.post(
      "/api/auth/forgotpassword",
      data: {"email": email},
    );
  }
}
