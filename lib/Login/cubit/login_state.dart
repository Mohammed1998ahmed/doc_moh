part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSusccfuly extends LoginState {}

final class LoginError extends LoginState {}

final class LoginChangLoading extends LoginState {}

final class LoginChangObsiervice extends LoginState {}
