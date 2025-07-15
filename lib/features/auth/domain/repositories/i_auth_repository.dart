

import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoginResponseEntity>> login({required LoginRequestParams payload});

}
