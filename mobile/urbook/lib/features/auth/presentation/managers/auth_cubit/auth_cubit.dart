import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbook/core/errors/server_failure.dart';
import 'package:urbook/core/services/web_service.dart';
import 'package:urbook/features/auth/data/data_source/auth/Auth_data_source.dart';
import 'package:urbook/features/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:urbook/features/auth/domain/repositories/auth_repository.dart';
import 'package:urbook/features/auth/domain/usecases/login_use_case.dart';
import 'package:urbook/features/auth/domain/usecases/signin_use_case.dart';
import 'package:urbook/features/auth/domain/usecases/verfiy_otp_use_case.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final WebService _webService = WebService();
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  late AuthDataSource _authDataSource;
  late AuthRepository _authRepository;
  late LoginUseCase _loginUseCase;
  late SignUpUseCase _signUpUseCase;
  late VerfiyOtpUseCase _verfiyOtpUseCase;

  Future<bool> login({required String email, required String password}) async {
    _authDataSource = AuthOnlineDataSource(_webService.freeDio);
    _authRepository = AuthRepositoryImp(_authDataSource);
    _loginUseCase = LoginUseCase(_authRepository);
    final result =
        await _loginUseCase.execute(email: email, password: password);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        log(error.errMessage);
        emit(LoginFailure());
        return Future.value(false);
      },
      (data) {
        emit(LoginSuccess());
        return Future.value(true);
      },
    );
  }

  Future<bool> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    _authDataSource = AuthOnlineDataSource(_webService.tokenDio);
    _authRepository = AuthRepositoryImp(_authDataSource);
    _signUpUseCase = SignUpUseCase(_authRepository);

    final result = await _signUpUseCase.execute(
        email: email, password: password, userName: userName);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        log(error.errMessage);
        emit(SginupFailure());
        return Future.value(false);
      },
      (data) {
        emit(LoginSuccess());
        return Future.value(true);
      },
    );
  }

  Future<bool> verfiyOtp({required String otp}) async {
    _authDataSource = AuthOnlineDataSource(_webService.freeDio);
    _authRepository = AuthRepositoryImp(_authDataSource);
    _verfiyOtpUseCase = VerfiyOtpUseCase(_authRepository);
    final result = await _verfiyOtpUseCase.execute(otp: otp);
    return result.fold((fail) {
      var error = fail as ServerFailure;
      log(error.errMessage);
      emit(VerfiyOtpFailure());
      return Future.value(false);
    }, (data) {
      emit(VerfiyOtpSuccess());
      return Future.value(true);
    });
  }
}
