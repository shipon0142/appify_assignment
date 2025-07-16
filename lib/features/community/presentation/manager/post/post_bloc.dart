import 'package:bloc/bloc.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/use_cases/create_post_usecase.dart';
import 'package:equatable/equatable.dart';


part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePostUseCase useCase;

  PostBloc({required this.useCase}) : super(PostInitial()) {
    on<CreatePost>(_onCreatePost);
  }

  Future<void> _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
    emit(PostLoading());

    final result = await useCase(
      payload: event.payload
    );
    result.fold(
      (failure) => emit(PostError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(PostSuccess(response: response));
      },
    );
  }
}
