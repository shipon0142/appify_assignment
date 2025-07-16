part of 'get_comments_bloc.dart';

sealed class GetCommentsState extends Equatable {
  const GetCommentsState();

  @override
  List<Object> get props => [];
}

class GetCommentsInitial extends GetCommentsState {}

class GetCommentsLoading extends GetCommentsState {}

class GetCommentsError extends GetCommentsState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const GetCommentsError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class GetCommentsSuccess extends GetCommentsState {
  final List<Comment> comments;
  const GetCommentsSuccess({required this.comments});
}
