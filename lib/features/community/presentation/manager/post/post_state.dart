part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostError extends PostState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const PostError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class PostSuccess extends PostState {
  final dynamic response;
  const PostSuccess({required this.response});
}
