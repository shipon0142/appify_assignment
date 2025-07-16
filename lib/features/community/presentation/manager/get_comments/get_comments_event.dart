part of 'get_comments_bloc.dart';

sealed class GetCommentsEvent extends Equatable {
  const GetCommentsEvent();
  @override
  List<Object?> get props => [];
}

class GetComments extends GetCommentsEvent {
  final int feedId;
  const GetComments({required this.feedId});
}

