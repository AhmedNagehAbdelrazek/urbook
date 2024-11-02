part of 'login_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {}
