part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const LoginError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class LoginSuccess extends LoginState {
  final LoginResponseEntity response;

  const LoginSuccess({required this.response});
}
