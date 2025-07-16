import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/data/res/comment_model/comment_model.dart';
import 'package:code_base/features/community/data/res/feed_model/feed_model.dart';

import '../api_service/community_api_service.dart';
import 'i_community_data_source.dart';

class CommunityDataSource extends ICommunityDataSource {
  final CommunityApiService apiService;

  CommunityDataSource({required this.apiService});

  @override
  Future<List<FeedModel>> getFeeds({
    required int communityId,
    required int spaceId,
  }) async {
    List<FeedModel> feeds =
        await apiService.getFeeds(communityId: communityId, spaceId: spaceId);
    return feeds;
  }

  @override
  Future<dynamic> createPost({required CreatePostParams payload}) async {
    dynamic result = await apiService.createPost(payload: payload);
    return result;
  }

  @override
  Future<dynamic> createComment({required CreateCommentParams payload}) async {
    dynamic result = await apiService.createComment(payload: payload);
    return result;
  }

  @override
  Future<dynamic> createReaction({required CreateReactionParams payload}) async {
    dynamic result = await apiService.createReaction(payload: payload);
    return result;
  }

  @override
  Future<List<CommentModel>> getComments({required int feedId}) async {
    dynamic result = await apiService.getComments(feedId: feedId);
    return result;
  }
}
