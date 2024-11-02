import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
}
