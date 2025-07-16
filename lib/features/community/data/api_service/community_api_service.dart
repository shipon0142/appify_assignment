import 'package:code_base/core/network/api_config.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';
import 'package:code_base/features/community/data/req/create_post_request_params.dart';
import 'package:code_base/features/community/data/res/feed_model/feed_model.dart';
import 'package:dio/dio.dart';

class CommunityApiService {
  final Dio _dio;

  CommunityApiService(this._dio);

  Future<List<FeedModel>> getFeeds({
    required int communityId,
    required int spaceId,
  }) async {
    final formData = FormData.fromMap({
      'community_id': communityId,
      'space_id': spaceId,
    });

    final response = await _dio.post(
      APIConfig.kFeedsUrl,
      data: formData,
      options: Options(
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    final List<dynamic> raw = response.data as List<dynamic>;

    return raw
        .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<dynamic> createPost({
    required CreatePostParams payload,
  }) async {
    final response = await _dio.post(
      APIConfig.kPostUrl,
      data: payload,
    );
    return response.data;
  }
}
