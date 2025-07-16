import 'package:bloc/bloc.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/domain/use_cases/create_Reaction_usecase.dart';
import 'package:code_base/features/community/domain/use_cases/create_post_usecase.dart';
import 'package:equatable/equatable.dart';


part 'create_reaction_event.dart';

part 'create_reaction_state.dart';

class CreateReactionBloc extends Bloc<CreateReactionEvent, CreateReactionState> {
  final CreateReactionUseCase useCase;

  CreateReactionBloc({required this.useCase}) : super(CreateReactionInitial()) {
    on<CreateReaction>(_onCreateCreateReaction);
  }

  Future<void> _onCreateCreateReaction(CreateReaction event, Emitter<CreateReactionState> emit) async {
    emit(CreateReactionLoading());

    final result = await useCase(
      payload: event.payload
    );
    result.fold(
      (failure) => emit(CreateReactionError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(CreateReactionSuccess(response: response));
      },
    );
  }
}
