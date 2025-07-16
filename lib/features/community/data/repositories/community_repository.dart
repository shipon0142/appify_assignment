import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/core/network/error_handler.dart';
import 'package:code_base/core/network/network_info.dart';
import 'package:code_base/features/auth/data/data_sources/i_auth_data_source.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/community/data/data_sources/i_community_data_source.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/req/create_reaction_request_params.dart';
import 'package:code_base/features/community/domain/entity/comment.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/repositories/i_community_repository.dart';

class CommunityRepository extends ICommunityRepository {
  final ICommunityDataSource iDataSource;
  final NetworkInfo networkInfo;

  CommunityRepository({
    required this.iDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Feed>>> getFeeds({
    required int communityId,
    required int spaceId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result = await iDataSource.getFeeds(
          communityId: communityId, spaceId: spaceId);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, dynamic>> createPost({
    required CreatePostParams payload,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result = await iDataSource.createPost(payload: payload);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, dynamic>> createComment({
    required CreateCommentParams payload,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result = await iDataSource.createComment(payload: payload);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, dynamic>> createReaction({
    required CreateReactionParams payload,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result = await iDataSource.createReaction(payload: payload);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
  @override
  Future<Either<Failure, List<Comment>>> getComments({
    required int feedId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result = await iDataSource.getComments(feedId: feedId);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
