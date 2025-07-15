

import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';

import '../api_service/auth_api_service.dart';
import 'i_auth_data_source.dart';

class AuthDataSource extends IAuthDataSource {
  final AuthApiService apiService;

  AuthDataSource({required this.apiService});
  @override
  Future<LoginResponseModel> login({required LoginRequestParams payload}) async {
    LoginResponseModel users = await apiService.login(payload: payload);
    return users;
  }

}
