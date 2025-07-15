part of 'community_bloc.dart';

sealed class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityError extends CommunityState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const CommunityError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class CommunitySuccess extends CommunityState {
  final List<Feed> feeds;

  const CommunitySuccess({required this.feeds});
}
