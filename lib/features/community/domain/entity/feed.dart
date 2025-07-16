import 'package:code_base/features/community/domain/entity/file.dart';
import 'package:code_base/features/community/domain/entity/meta.dart';
import 'package:code_base/features/community/domain/entity/user.dart';

class Feed {
  final int id;
  final String? feedTxt;
  final String? title;
  final String? activityType;
  final String? fileType;
  final List<File>? files;
  final List<LikeType>? likeTypes;
  final int? likeCount;
  final int? commentCount;
  final DateTime? createdAt;
  final String? publishDate;
  final String? name;
  final String? pic;
  final User? user;
  final Meta? meta;

  Feed({
    required this.id,
    this.feedTxt,
    this.title,
    this.activityType,
    this.fileType,
    this.files,
    this.likeCount,
    this.commentCount,
    this.createdAt,
    this.name,
    this.pic,
    this.user,
    this.meta,
    this.publishDate,
    this.likeTypes,
  });

}

class LikeType {
  final String reactionType;
  LikeType({
    required this.reactionType,
  });
}