import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
  Future<Either<Failure, bool>> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<Either<Failure, bool>> verfiyOtp({required String otp});
  Future<Either<Failure, bool>> forgotPassword({required String email});
  Future<Either<Failure, bool>> resetPassword({required String newPassword});
 
}
