

import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';
import 'package:code_base/features/community/data/res/feed_model/feed_model.dart';

import '../api_service/community_api_service.dart';
import 'i_community_data_source.dart';

class CommunityDataSource extends ICommunityDataSource {
  final CommunityApiService apiService;

  CommunityDataSource({required this.apiService});
  @override
  Future<List<FeedModel>> getFeeds({  required int communityId,
    required int spaceId,}) async {
    List<FeedModel> feeds = await apiService.getFeeds(communityId: communityId, spaceId: spaceId);
    return feeds;
  }

}
