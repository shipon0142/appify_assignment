import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';

abstract class ICommunityDataSource {

  Future<List<Feed>> getFeeds({required int communityId,
    required int spaceId,});
  Future<dynamic> createPost({required CreatePostParams payload,});

}
