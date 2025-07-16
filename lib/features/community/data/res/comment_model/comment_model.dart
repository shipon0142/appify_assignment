import 'package:code_base/features/community/data/res/user_model/user_model.dart';
import 'package:code_base/features/community/domain/entity/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel extends Comment with _$CommentModel {
  const factory CommentModel({
    required int id,
    @JsonKey(name: 'school_id') int? schoolId,
    @JsonKey(name: 'feed_id') int? feedId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'reply_count') int? replyCount,
    @JsonKey(name: 'like_count') int? likeCount,
    @JsonKey(name: 'comment_txt') String? commentTxt,
    @JsonKey(name: 'parrent_id') int? parentId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    dynamic file,
    @JsonKey(name: 'private_user_id') int? privateUserId,
    @JsonKey(name: 'is_author_and_anonymous') int? isAuthorAndAnonymous,
    dynamic gift,
    @JsonKey(name: 'seller_id') dynamic sellerId,
    @JsonKey(name: 'gifted_coins') dynamic giftedCoins,
    List<dynamic>? replies,
    List<dynamic>? totalLikes,
    @JsonKey(name: 'reaction_types') List<dynamic>? reactionTypes,
    UserModel? user,
    @JsonKey(name: 'private_user') dynamic privateUser,
    @JsonKey(name: 'commentlike') dynamic commentLike,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
