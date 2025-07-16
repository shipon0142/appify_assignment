part of 'create_comment_bloc.dart';

sealed class CreateCommentState extends Equatable {
  const CreateCommentState();

  @override
  List<Object> get props => [];
}

class CreateCommentInitial extends CreateCommentState {}

class CreateCommentLoading extends CreateCommentState {}

class CreateCommentError extends CreateCommentState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const CreateCommentError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class CreateCommentSuccess extends CreateCommentState {
  final dynamic response;
  const CreateCommentSuccess({required this.response});
}
