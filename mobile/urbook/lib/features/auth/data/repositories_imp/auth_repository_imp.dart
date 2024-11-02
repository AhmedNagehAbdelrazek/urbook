import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/core/errors/server_failure.dart';
import 'package:urbook/core/services/web_service.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_source/login/Auth_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);
  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    WebService webService = WebService();
    try {
      final response =
          await _authDataSource.login(email: email, password: password);
      if (response.statusCode == 200) {
        final String token = response.data["token"];
        webService.saveToken(token);
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            errMessage: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure.fromDioException(error),
      );
    }
  }
}
