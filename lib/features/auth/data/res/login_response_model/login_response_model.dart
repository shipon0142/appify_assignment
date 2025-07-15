
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel extends LoginResponseEntity with _$LoginResponseModel {
  const factory LoginResponseModel({
    String? type,
    String? token,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

