part of 'logout_bloc.dart';


sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const LogoutError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class LogoutSuccess extends LogoutState {
  final dynamic response;

  const LogoutSuccess({required this.response});
}
