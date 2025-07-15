import 'package:code_base/features/community/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends User with _$UserModel {
  const factory UserModel({
    required int id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'profile_pic') String? profilePic,
    @JsonKey(name: 'user_type') String? userType,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}