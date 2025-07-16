import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/entity/comment.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:code_base/features/community/domain/repositories/i_community_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentsUseCase {
  ICommunityRepository iRepository;

  GetCommentsUseCase({required this.iRepository});
  Future<Either<Failure, List<Comment>>> call({
    required int feedId,
  }) async => await iRepository.getComments( feedId: feedId);
}
