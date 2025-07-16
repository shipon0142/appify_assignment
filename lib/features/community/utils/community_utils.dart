import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityUtils {
  static String getLikeCount(bool hasMe, int likeCount) {
    if (likeCount == 0) return '0 Likes';
    if (hasMe && likeCount == 1) return 'You like this';
    if (hasMe && likeCount == 2) return 'You and 1 other';
    if (hasMe) return 'You and ${likeCount - 1} others';
    return '$likeCount ${likeCount == 1 ? 'like' : 'likes'}';
  }
  Set<String> getReactionTypes(List<LikeType>? likeTypes) {
    if (likeTypes == null) return {};
    return likeTypes
        .map((e) => e.reactionType)
        .whereType<String>() // filters out nulls
        .toSet();
  }
  IconData getReactionIcon(String reactionType) {
    switch (reactionType.toLowerCase()) {
      case 'like':
        return Icons.thumb_up;
      case 'love':
        return Icons.favorite;
      case 'haha':
        return Icons.emoji_emotions;
      case 'wow':
        return Icons.emoji_objects;
      case 'sad':
        return Icons.sentiment_dissatisfied;
      case 'angry':
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.thumb_up_alt_outlined; // fallback icon
    }
  }


}
