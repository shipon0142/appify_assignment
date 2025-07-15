

import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:dartz/dartz.dart';

abstract class ICommunityRepository {
  Future<Either<Failure, List<Feed>>> getFeeds({required int communityId,
    required int spaceId,});

}
