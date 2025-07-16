import 'package:bloc/bloc.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/use_cases/create_comment_usecase.dart';
import 'package:code_base/features/community/domain/use_cases/create_post_usecase.dart';
import 'package:equatable/equatable.dart';


part 'create_comment_event.dart';

part 'create_comment_state.dart';

class CreateCommentBloc extends Bloc<CreateCommentEvent, CreateCommentState> {
  final CreateCommentUseCase useCase;

  CreateCommentBloc({required this.useCase}) : super(CreateCommentInitial()) {
    on<CreateComment>(_onCreateCreateComment);
  }

  Future<void> _onCreateCreateComment(CreateComment event, Emitter<CreateCommentState> emit) async {
    emit(CreateCommentLoading());

    final result = await useCase(
      payload: event.payload
    );
    result.fold(
      (failure) => emit(CreateCommentError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(CreateCommentSuccess(response: response));
      },
    );
  }
}
