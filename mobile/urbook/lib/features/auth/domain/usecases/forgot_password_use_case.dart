import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _authRepository;
  ForgotPasswordUseCase(this._authRepository);
  Future<Either<Failure, bool>> execute({required String email}) async {
    return await _authRepository.forgotPassword(email: email);
  }
}
