part of "injection_container.dart";

final sl = GetIt.instance;

Future<void> init() async {
  //* ---------------------------------  Feature Sign in  --------------------------

  // ? Bloc
  sl.registerFactory(() => SignInBloc(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      skipSignInUpUseCase: sl(),
      getSplashScreenParamsUseCase: sl(),
      logOutUseCase: sl(),
      resetPasswordUseCase: sl(),
      getUserTokenUseCase: sl(),
      getUserByIdUseCase: sl(),
      updateUserByIdUseCase: sl()));

  // ? Use cases
  sl.registerLazySingleton(() => SignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => SkipSignInUpUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GetSplashScreenParamsUseCase(repository: sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogOutUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateUserByIdUseCase(repository: sl()));
  // ? Repository
  sl.registerLazySingleton<SignInUpRepository>(() => SignInUpRepositoryImpl(
      signInUpRemoteDataSource: sl(),
      signInUpLocalDataDataSource: sl(),
      cartLocalDataDataSource: sl(),
      networkInfo: sl()));

  // ? Data sources
  sl.registerLazySingleton<SignInUpRemoteDataSource>(
      () => SignInUpRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SignInUpLocalDataDataSource>(
      () => SignInUpLocalDataDataSourceImpl(sharedPreferences: sl()));

  //* ---------------------------------  Feature Products  --------------------------

  // ? Bloc
  sl.registerFactory(
    () => ProductBloc(
      getAllVignetteProductUseCaseCase: sl(),
      getAllRoutesWithStringLocationsUseCaseCase: sl(),
      getVignetteAndTollsFromRoutesUseCase: sl(),
      getAllVehiclesUseCase: sl(),
      getCountryMapUseCase: sl(),
    ),
  );

  // ? Use cases
  sl.registerLazySingleton(
      () => GetAllVignetteProductUseCaseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GetAllRoutesWithStringLocationsUseCaseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GetVignetteAndTollsFromRoutesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllVehiclesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCountryMapUseCase(repository: sl()));

  // ? Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      networkInfo: sl(),
      productDataSource: sl(),
      googleMapsRemoteDataSource: sl(),
    ),
  );

  // ? Data sources
  sl.registerLazySingleton<ProductDataSource>(
      () => ProductDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Google Maps Places  --------------------------

  // ? Bloc
  sl.registerFactory(() => GoogleMapsBloc(
      googlePlacesPredictionUseCase: sl(),
      googlePlacesPredictionDetailsUseCase: sl()));

  // ? Use cases
  sl.registerLazySingleton(
      () => GooglePlacesPredictionUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GooglePlacesPredictionDetailsUseCase(repository: sl()));

  // ? Repository
  sl.registerLazySingleton<GoogleMapsRepository>(() => GoogleMapsRepositoryImpl(
      networkInfo: sl(), googleMapsRemoteDataSource: sl()));

  // ? Data sources
  sl.registerLazySingleton<GoogleMapsRemoteDataSource>(
      () => GoogleMapsRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Payment  --------------------------

  // ? Bloc
  sl.registerFactory(() => AppPaymentBloc(
      payWithStripeUseCase: sl(),
      payWithPayPalUseCase: sl(),
      confirmPaymentUseCase: sl()));

  // ? Use cases
  sl.registerLazySingleton(() => PayWithStripeUseCase(repository: sl()));
  sl.registerLazySingleton(() => PayWithPayPalUseCase(repository: sl()));
  sl.registerLazySingleton(() => ConfirmPaymentUseCase(repository: sl()));

  // ? Repository
  sl.registerLazySingleton<AppPaymentRepository>(() => AppPaymentRepositoryImpl(
      networkInfo: sl(),
      appPaymentRemoteDataSource: sl(),
      cartLocalDataDataSource: sl()));

  // ? Data sources
  sl.registerLazySingleton<AppPaymentRemoteDataSource>(
      () => AppPaymentRemoteDataSourceImpl(client: sl()));

  //* ---------------------------------  Feature Cart  --------------------------

  // ? Bloc
  sl.registerFactory(
    () => CartBloc(
      addProductToCartUseCase: sl(),
      deleteProductFromCartUseCase: sl(),
      getTotalCartPriceUseCase: sl(),
      getProductSFromUseCase: sl(),
    ),
  );

  // ? Use cases
  sl.registerLazySingleton(() => AddProductToCartUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => DeleteProductFromCartUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTotalCartPriceUseCase(repository: sl()));

  sl.registerLazySingleton(() => GetProductSFromUseCase(repository: sl()));

  // ? Repository
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartLocalDataDataSource: sl()));

  // ? Data sources
  sl.registerLazySingleton<CartLocalDataDataSource>(
      () => CartLocalDataDataSourceImpl(sharedPreferences: sl()));

  //*--------------------------------------- Core  --------------------------------------

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //*--------------------------------------- External  --------------------------------------

  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Connectivity());
  Stripe.publishableKey = stripePublishableLiveKey;
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  // await Stripe.instance.applySettings();

  // ------------------------ News ----------------------------------------

  // ? Bloc
  sl.registerFactory(
    () => NewsBloc(
      singleNewsUseCase: sl(),
      allNewsUseCase: sl(),
    ),
  );
  // ? Usecases
  sl.registerLazySingleton(() => FetchNewsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSpecificNewsUseCase(repository: sl()));
  // ? Repositories
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      networkInfo: sl(),
      newsDataSource: sl(),
    ),
  );
  // ? Data Sources
  sl.registerLazySingleton<NewsDataSource>(
    () => NewsDataSourceImpl(client: sl()),
  );

  // -------------------------------- Vignettes --------------------------------
// ? Bloc
  sl.registerFactory(
    () => VignetteBloc(
      signInUpLocalDataDataSource: sl(),
      getVignettesUseCase: sl(),
    ),
  );
  // ? Usecases
  sl.registerLazySingleton(() => GetVignettesUseCase(repository: sl()));
  // ? Repository
  sl.registerLazySingleton<VignetteRepository>(
    () => VignettesRepositoryImpl(
      networkInfo: sl(),
      vignettesRemoteDataSource: sl(),
    ),
  );
  // ? Data sources
  sl.registerLazySingleton<VignettesRemoteDataSource>(
    () => VignettesRemoteDataSourceImpl(client: sl()),
  );

//* ---------------------  Feature Current Location  --------------------------

  // ? Bloc
  sl.registerFactory(
    () => GeoLocatorBloc(
      getCurrentPositionUseCase: sl(),
    ),
  );
  // ? Use case
  sl.registerLazySingleton(() => GetCurrentPositionUseCase(repository: sl()));
  // ? Repository
  sl.registerLazySingleton<GeoLocatorRepository>(
    () => GeoLocatorRepositoryImpl(
      geoLocatorDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // ? Data sources
  sl.registerLazySingleton<GeoLocatorDataSource>(
    () => GeoLocatorDataSourceImpl(
      prefs: sl(),
    ),
  );
  sl.registerLazySingleton(() => LicensePlateBloc());
}
