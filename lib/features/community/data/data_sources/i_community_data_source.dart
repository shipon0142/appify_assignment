import 'package:code_base/features/community/domain/entity/feed.dart';

abstract class ICommunityDataSource {

  Future<List<Feed>> getFeeds({required int communityId,
    required int spaceId,});

}
