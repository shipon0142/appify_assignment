import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/core/network/api_config.dart';
import 'package:code_base/core/network/network_info.dart';
import 'package:code_base/core/utility/constants/constants_manager.dart';
import 'package:code_base/features/auth/data/data_sources/i_auth_data_source.dart';
import 'package:code_base/features/auth/data/data_sources/auth_data_source.dart';
import 'package:code_base/features/auth/data/repositories/auth_repository.dart';
import 'package:code_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:code_base/features/auth/domain/use_cases/login_usecase.dart';
import 'package:code_base/features/auth/presentation/manager/login_bloc.dart';
import 'package:code_base/features/community/data/api_service/community_api_service.dart';
import 'package:code_base/features/community/data/data_sources/community_data_source.dart';
import 'package:code_base/features/community/data/data_sources/i_community_data_source.dart';
import 'package:code_base/features/community/data/repositories/community_repository.dart';
import 'package:code_base/features/community/domain/repositories/i_community_repository.dart';
import 'package:code_base/features/community/domain/use_cases/community_usecase.dart';
import 'package:code_base/features/community/presentation/manager/community_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/api_service/auth_api_service.dart';

part 'di.dart';
