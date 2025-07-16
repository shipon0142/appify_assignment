part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class GetLogin extends LoginEvent {
  final LoginRequestParams payload;
  const GetLogin({required this.payload});
}

