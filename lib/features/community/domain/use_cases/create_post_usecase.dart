import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:code_base/features/community/domain/repositories/i_community_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePostUseCase {
  ICommunityRepository iRepository;

  CreatePostUseCase({required this.iRepository});
  Future<Either<Failure, dynamic>> call({
    required CreatePostParams payload,
  }) async => await iRepository.createPost( payload: payload);
}
