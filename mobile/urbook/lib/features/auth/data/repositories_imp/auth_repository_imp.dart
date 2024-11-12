import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/core/errors/server_failure.dart';
import 'package:urbook/core/services/web_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth/Auth_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);
  final WebService _webService = WebService();
  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await _authDataSource.login(email: email, password: password);

      if (response.statusCode == 200) {
        final String token = response.data["token"];
        _webService.saveToken(token);
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

  @override
  Future<Either<Failure, bool>> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final response = await _authDataSource.signUp(
          email: email, password: password, userName: userName);
      if (response.statusCode == 200) {
        _webService.saveEmail(email);
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            errMessage: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure.fromDioException(error),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> verfiyOtp({required String otp}) async {
    try {
      final response = await _authDataSource.verfiyOtp(verfiyOtp: otp);
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
              statusCode: response.statusCode.toString(),
              errMessage: response.data["message"]),
        );
      }
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(error),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword({required String email}) async {
    try {
      final response = await _authDataSource.forgotPassword(email: email);
      if (response.statusCode == 200) {
        _webService.saveResetToken(response.data["token"]);
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
              statusCode: response.statusCode.toString(),
              errMessage: response.data["message"]),
        );
      }
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioException(error));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      {required String newPassword}) async {
    try {
      final response =
          await _authDataSource.resetPassword(newPassword: newPassword);
      if (response.statusCode == 200) {
        final String token = response.data["token"];
        _webService.saveToken(token);
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            errMessage: response.data["message"],
            statusCode: response.statusCode.toString(),
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
