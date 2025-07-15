import 'package:code_base/core/network/failure.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  IAuthRepository iRepository;

  LoginUseCase({required this.iRepository});
  Future<Either<Failure, LoginResponseEntity>> call({
    required LoginRequestParams payload,
  }) async => await iRepository.login(payload: payload);
}
