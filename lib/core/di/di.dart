part of '../../../../core/di/di_import_path.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  ///==========================================================================
  ///================================== CORE ==================================
  ///==========================================================================
  injector.registerLazySingleton<Dio>(() {
    Dio dio = Dio(BaseOptions(
      connectTimeout: AppConstants.apiTimeOut,
      receiveTimeout: AppConstants.apiTimeOut,
      sendTimeout: AppConstants.apiTimeOut,
    ));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {

          handler.next(options);
        },
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final cacheUtils = await CacheUtils.getInstance();
        final token = 'Bearer ${cacheUtils.getToken()}';
        options.headers[contentType] = applicationJson;
        options.headers[accept] = applicationJson;
        options.headers['Authorization'] = token;
        handler.next(options);
      },
    ));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );
    return dio;
  });

  //NetworkInfo instance
  injector.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  injector.registerSingletonAsync<CacheUtils>(
          () async => await CacheUtils.getInstance());

  injector.registerSingletonAsync<SharedPreferences>(
          () async => await SharedPreferences.getInstance());

  await GetIt.instance.isReady<SharedPreferences>();

  ///==========================================================================
  ///================================ API SERVICE =============================
  ///==========================================================================

  injector.registerSingleton<AuthApiService>(
    AuthApiService(injector()),
  );
  injector.registerSingleton<CommunityApiService>(
    CommunityApiService(injector()),
  );

  ///==========================================================================
  ///=============================== DATA SOURCES =============================
  ///==========================================================================
  injector.registerLazySingleton<IAuthDataSource>(
    () => AuthDataSource(
      apiService: injector(),
    ),
  );

  injector.registerLazySingleton<ICommunityDataSource>(
    () => CommunityDataSource(
      apiService: injector(),
    ),
  );

  ///==========================================================================
  ///=============================== REPOSITORIES =============================
  ///==========================================================================

  injector.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      iDataSource: injector(),
      networkInfo: injector(),
    ),
  );  injector.registerLazySingleton<ICommunityRepository>(
    () => CommunityRepository(
      iDataSource: injector(),
      networkInfo: injector(),
    ),
  );

  ///==========================================================================
  ///================================= USE CASES ==============================
  ///==========================================================================

  injector.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      iRepository: injector(),
    ),
  );

  injector.registerLazySingleton<CommunityUseCase>(
    () => CommunityUseCase(
      iRepository: injector(),
    ),
  );

  injector.registerLazySingleton<CreatePostUseCase>(
    () => CreatePostUseCase(
      iRepository: injector(),
    ),
  );

  ///============================================================================
  ///================================= BLOCS ====================================
  ///============================================================================

  injector.registerFactory<LoginBloc>(
    () => LoginBloc(
      useCase: injector(),
    ),
  );
  injector.registerFactory<CommunityBloc>(
    () => CommunityBloc(
      useCase: injector(),
    ),
  );
  injector.registerFactory<PostBloc>(
    () => PostBloc(
      useCase: injector(),
    ),
  );
}
