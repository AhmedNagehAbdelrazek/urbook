import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> login({required email, required password});
}

class AuthOnlineDataSource extends AuthDataSource {
  final Dio _dio;
  AuthOnlineDataSource(this._dio);
  @override
  Future<Response> login({required email, required password}) async {
    return await _dio.post(
      "/api/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
