import 'package:code_base/features/community/domain/entity/user.dart';

class Comment {
  final int id;
  final int? schoolId;
  final int? feedId;
  final int? userId;
  final int? replyCount;
  final int? likeCount;
  final String? commentTxt;
  final int? parentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic file;
  final int? privateUserId;
  final int? isAuthorAndAnonymous;
  final dynamic gift;
  final dynamic sellerId;
  final dynamic giftedCoins;
  final List<dynamic>? replies;
  final List<dynamic>? totalLikes;
  final List<dynamic>? reactionTypes;
  final User? user;
  final dynamic privateUser;
  final dynamic commentLike;

  Comment({
    required this.id,
    this.schoolId,
    this.feedId,
    this.userId,
    this.replyCount,
    this.likeCount,
    this.commentTxt,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.file,
    this.privateUserId,
    this.isAuthorAndAnonymous,
    this.gift,
    this.sellerId,
    this.giftedCoins,
    this.replies,
    this.totalLikes,
    this.reactionTypes,
    this.user,
    this.privateUser,
    this.commentLike,
  });

}
