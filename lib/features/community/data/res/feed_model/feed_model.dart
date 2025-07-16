import 'package:code_base/features/community/data/res/file_model/file_model.dart';
import 'package:code_base/features/community/data/res/like_model/like_type_model.dart';
import 'package:code_base/features/community/data/res/meta_model/meta_model.dart';
import 'package:code_base/features/community/data/res/user_model/user_model.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

@freezed
class FeedModel extends Feed with _$FeedModel {
  const factory FeedModel({
    required int id,
    @JsonKey(name: 'feed_txt') String? feedTxt,
    String? title,
    @JsonKey(name: 'activity_type') String? activityType,
    @JsonKey(name: 'file_type') String? fileType,
    List<FileModel>? files,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'comment_count') int? commentCount,
    @JsonKey(name: 'likeType') List<LikeTypeModel>? likeTypes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'publish_date') String? publishDate,
    String? name,
    String? pic,
    UserModel? user,
    MetaModel? meta,
  }) = _FeedModel;

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);
}
