part of 'community_bloc.dart';

sealed class CommunityEvent extends Equatable {
  const CommunityEvent();
  @override
  List<Object?> get props => [];
}

class GetFeeds extends CommunityEvent {
  final int communityId;
  final int spaceId;
  const GetFeeds({required this.communityId,required this.spaceId});
}

