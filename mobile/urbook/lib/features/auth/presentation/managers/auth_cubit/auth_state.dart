part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {}

final class SginupSuccess extends AuthState {}

final class SginupFailure extends AuthState {}

final class VerfiyOtpSuccess extends AuthState {}

final class VerfiyOtpFailure extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {}

final class ForgotPasswordFailure extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {}
