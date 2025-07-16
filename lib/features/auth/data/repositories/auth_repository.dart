import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/core/network/error_handler.dart';
import 'package:code_base/core/network/network_info.dart';
import 'package:code_base/features/auth/data/data_sources/i_auth_data_source.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/repositories/i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  final IAuthDataSource iDataSource;
  final NetworkInfo networkInfo;

  AuthRepository({
    required this.iDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResponseEntity>> login({
    required LoginRequestParams payload
  }) async {


    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result =
      await iDataSource.login(payload: payload);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
  @override
  Future<Either<Failure, dynamic>> logout() async {


    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result =
      await iDataSource.logout();
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

}
