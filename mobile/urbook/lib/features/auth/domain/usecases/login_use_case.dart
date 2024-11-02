import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  Future<Either<Failure, bool>> execute(
      {required String email, required String password}) async {
    return await _authRepository.login(email: email, password: password);
  }
}
