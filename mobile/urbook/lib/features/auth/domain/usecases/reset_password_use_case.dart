import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _authRepository;
  ResetPasswordUseCase(this._authRepository);
  Future<Either<Failure, bool>> execute({required String newPassword}) async {
    return await _authRepository.resetPassword(newPassword: newPassword);
  }
}
