import 'package:code_base/core/network/failure.dart';

import 'package:code_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  IAuthRepository iRepository;

  LogoutUseCase({required this.iRepository});
  Future<Either<Failure, dynamic>> call() async => await iRepository.logout();
}
