

import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/data/res/comment_model/comment_model.dart';
import 'package:code_base/features/community/domain/entity/comment.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:dartz/dartz.dart';

abstract class ICommunityRepository {
  Future<Either<Failure, List<Feed>>> getFeeds({required int communityId,
    required int spaceId,});

  Future<Either<Failure, dynamic>> createPost({required CreatePostParams payload});
  Future<Either<Failure, dynamic>> createComment({required CreateCommentParams payload});
  Future<Either<Failure, dynamic>> createReaction({required CreateReactionParams payload});
  Future<Either<Failure, List<Comment>>> getComments({required int feedId});

}
