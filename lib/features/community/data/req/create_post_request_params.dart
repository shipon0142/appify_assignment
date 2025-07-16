class CreatePostParams {
  final String? feedTxt;
  final int? communityId;
  final int? spaceId;
  final String? uploadType;
  final String? activityType;
  final int? isBackground;

  CreatePostParams({
    this.feedTxt,
    this.communityId,
    this.spaceId,
    this.uploadType,
    this.activityType,
    this.isBackground,
  });

  factory CreatePostParams.fromJson(Map<String, dynamic> json) {
    return CreatePostParams(
      feedTxt: json['feed_txt'] as String?,
      communityId: json['community_id'] as int?,
      spaceId: json['space_id'] as int?,
      uploadType: json['uploadType'] as String?,
      activityType: json['activity_type'] as String?,
      isBackground: json['is_background'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (feedTxt != null) 'feed_txt': feedTxt,
      if (communityId != null) 'community_id': communityId,
      if (spaceId != null) 'space_id': spaceId,
      if (uploadType != null) 'uploadType': uploadType,
      if (activityType != null) 'activity_type': activityType,
      if (isBackground != null) 'is_background': isBackground,
    };
  }
}

