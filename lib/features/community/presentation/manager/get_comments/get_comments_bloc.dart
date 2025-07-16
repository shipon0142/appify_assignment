import 'package:bloc/bloc.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/entity/comment.dart';
import 'package:code_base/features/community/domain/use_cases/create_comment_usecase.dart';
import 'package:code_base/features/community/domain/use_cases/create_post_usecase.dart';
import 'package:code_base/features/community/domain/use_cases/get_comments_usecase.dart';
import 'package:equatable/equatable.dart';


part 'get_comments_event.dart';

part 'get_comments_state.dart';

class GetCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  final GetCommentsUseCase useCase;

  GetCommentsBloc({required this.useCase}) : super(GetCommentsInitial()) {
    on<GetComments>(_onCreateGetComments);
  }

  Future<void> _onCreateGetComments(GetComments event, Emitter<GetCommentsState> emit) async {
    emit(GetCommentsLoading());

    final result = await useCase(
      feedId: event.feedId
    );
    result.fold(
      (failure) => emit(GetCommentsError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(GetCommentsSuccess(comments: response));
      },
    );
  }
}
