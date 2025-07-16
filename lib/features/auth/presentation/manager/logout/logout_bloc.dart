import 'package:bloc/bloc.dart';
import 'package:code_base/features/auth/domain/use_cases/logout_usecase.dart';

import 'package:equatable/equatable.dart';



part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase useCase;

  LogoutBloc({required this.useCase}) : super(LogoutInitial()) {
    on<GetLogout>(_onLogout);
  }

  Future<void> _onLogout(GetLogout event, Emitter<LogoutState> emit) async {
    emit(LogoutLoading());

    final result = await useCase();
    result.fold(
      (failure) => emit(LogoutError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(LogoutSuccess(response: response));
      },
    );
  }
}
