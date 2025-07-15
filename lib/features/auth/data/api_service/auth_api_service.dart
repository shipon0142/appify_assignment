
import 'package:code_base/core/network/api_config.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);


  Future<LoginResponseModel> login({required LoginRequestParams payload}) async {
    final response = await _dio.post(
        APIConfig.kLoginUrl,
      data: payload.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
