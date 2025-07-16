const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";

class APIConfig {
  static const String kBaseUrl = 'https://ezyappteam.ezycourse.com';
  static const String kLoginUrl = '$kBaseUrl/api/app/student/auth/login';
  static const String kFeedsUrl = '$kBaseUrl/api/app/teacher/community/getFeed?status=feed';
  static const String kPostUrl = '$kBaseUrl/api/app/teacher/community/createFeedWithUpload';
}
