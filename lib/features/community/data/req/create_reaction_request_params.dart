class CreateReactionParams {
  final int? feedId;
  final String? reactionType;
  final String? action;
  final String? reactionSource;

  CreateReactionParams({
    this.feedId,
    this.reactionType,
    this.action,
    this.reactionSource,
  });

  factory CreateReactionParams.fromJson(Map<String, dynamic> json) {
    return CreateReactionParams(
      feedId: json['feed_id'] as int?,
      reactionType: json['reaction_type'] as String?,
      action: json['action'] as String?,
      reactionSource: json['reactionSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (feedId != null) 'feed_id': feedId,
      if (reactionType != null) 'reaction_type': reactionType,
      if (action != null) 'action': action,
      if (reactionSource != null) 'reactionSource': reactionSource,
    };
  }
}
