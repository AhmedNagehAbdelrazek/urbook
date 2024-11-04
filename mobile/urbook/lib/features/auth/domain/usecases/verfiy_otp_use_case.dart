import 'package:dartz/dartz.dart';
import 'package:urbook/core/errors/failure.dart';
import 'package:urbook/features/auth/domain/repositories/auth_repository.dart';

class VerfiyOtpUseCase {
  final AuthRepository _authRepository;
  VerfiyOtpUseCase(this._authRepository);
  Future<Either<Failure, bool>> execute({required String otp}) async {
    return await _authRepository.verfiyOtp(otp: otp);
  }
}
