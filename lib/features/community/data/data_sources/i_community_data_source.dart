import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/data/res/comment_model/comment_model.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';

abstract class ICommunityDataSource {

  Future<List<Feed>> getFeeds({required int communityId,
    required int spaceId,});
  Future<dynamic> createPost({required CreatePostParams payload,});
  Future<dynamic> createComment({required CreateCommentParams payload,});
  Future<dynamic> createReaction({required CreateReactionParams payload,});
  Future<List<CommentModel>> getComments({required int feedId,});

}
