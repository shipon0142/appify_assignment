part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object?> get props => [];
}

class CreatePost extends PostEvent {
  final CreatePostParams payload;
  const CreatePost({required this.payload});
}

