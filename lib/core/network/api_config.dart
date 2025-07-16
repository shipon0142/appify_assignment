const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";

class APIConfig {
  static const String kBaseUrl = 'https://ezyappteam.ezycourse.com';
  static const String kLoginUrl = '$kBaseUrl/api/app/student/auth/login';
  static const String kLogOutUrl = '$kBaseUrl/api/app/student/auth/logout';
  static const String kFeedsUrl = '$kBaseUrl/api/app/teacher/community/getFeed?status=feed';
  static const String kPostUrl = '$kBaseUrl/api/app/teacher/community/createFeedWithUpload';
  static const String kPostCommentUrl = '$kBaseUrl/api/app/student/comment/createComment';
  static const String kPostReactionUrl = '$kBaseUrl/api/app/teacher/community/createLike';
  static const String kGetCommentUrl = '$kBaseUrl/api/app/student/comment/getComment';
}
