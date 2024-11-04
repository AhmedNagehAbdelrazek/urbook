import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);
  Future<Either<Failure, bool>> execute(
      {required String email,
      required String password,
      required String userName}) async {
    return await _authRepository.signUp(
        email: email, password: password, userName: userName);
  }
}
