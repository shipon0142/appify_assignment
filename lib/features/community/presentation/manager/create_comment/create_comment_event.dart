part of 'create_comment_bloc.dart';

sealed class CreateCommentEvent extends Equatable {
  const CreateCommentEvent();
  @override
  List<Object?> get props => [];
}

class CreateComment extends CreateCommentEvent {
  final CreateCommentParams payload;
  const CreateComment({required this.payload});
}

