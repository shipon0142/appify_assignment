class CreateCommentParams {
  final int? feedId;
  final int? feedUserId;
  final String? commentTxt;
  final String? commentSource;

  CreateCommentParams({
    this.feedId,
    this.feedUserId,
    this.commentTxt,
    this.commentSource,
  });

  factory CreateCommentParams.fromJson(Map<String, dynamic> json) {
    return CreateCommentParams(
      feedId: json['feed_id'] as int?,
      feedUserId: json['feed_user_id'] as int?,
      commentTxt: json['comment_txt'] as String?,
      commentSource: json['commentSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (feedId != null) 'feed_id': feedId,
      if (feedUserId != null) 'feed_user_id': feedUserId,
      if (commentTxt != null) 'comment_txt': commentTxt,
      if (commentSource != null) 'commentSource': commentSource,
    };
  }
}


