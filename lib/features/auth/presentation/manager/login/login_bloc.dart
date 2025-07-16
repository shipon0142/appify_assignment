import 'package:bloc/bloc.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;

  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<GetLogin>(_onLogin);
  }

  Future<void> _onLogin(GetLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await useCase(payload: event.payload);
    result.fold(
      (failure) => emit(LoginError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(LoginSuccess(response: response));
      },
    );
  }
}
