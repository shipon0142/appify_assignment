
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';

abstract class IAuthDataSource {

  Future<LoginResponseEntity> login({required LoginRequestParams payload});
  Future<dynamic> logout();

}
