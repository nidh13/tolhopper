import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/presentation/bloc/product_bloc.dart';
import 'package:tollhopper/features/toll_calculator/presentation/route_trajectory/route_trajectory_ui.dart';
import 'package:tollhopper/features/toll_calculator/presentation/tabs_enums/calculator_pages_enum.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/calculatore_tab_ui.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/radio_enum/vehicle_enum.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/toll_selection.dart';
import 'package:tollhopper/global/common_widgets/error_widget/no_conexion_widget.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:tollhopper/global/google_map_bloc/presentation/bloc/google_maps_bloc.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';
import 'package:tollhopper/global/utils/dialog_utils.dart';
import 'package:tollhopper/global/utils/functions.dart';

class CalculatorTabPage extends StatefulWidget {
  const CalculatorTabPage({Key? key}) : super(key: key);

  @override
  State<CalculatorTabPage> createState() => _CalculatorTabPageState();
}

class _CalculatorTabPageState extends State<CalculatorTabPage> {
  final PageController _pageController = PageController();
  List<PriceVehicle> listVehicles = [];

  ////////////////////////////////// calculator Ui //////////////////////////////
  final TextEditingController _startLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  VehicleEnum vehicleSelected = VehicleEnum.car;

  bool _isFocusedStartLocation = false;
  final FocusNode _focusNodeStartLocation = FocusNode();
  bool _isFocusedDestination = false;
  final FocusNode _focusNodeDestination = FocusNode();

  final _calculatorFormKey = GlobalKey<FormState>();
  bool autoValidate = false;

  String? destinationId;
  String? startLocationId;

  // trajectory
  int indexTrajectory = 0;
  List<TollRoutesModel> _listRoutes = [];

  // Product Selection
  List<VignetteProduct> _listVignetteAustria = [];
  List<VignetteProduct> _listVignetteSlovenia = [];
  List<VignetteProduct> _listTollsAustria = [];
  List<VignetteProduct> _listVignetteSwitzerland = [];
  List<VignetteProduct> _listVignetteHungary = [];
  List<VignetteProduct> _listVignetteRomania = [];
  List<VignetteProduct> _listVignetteCzech = [];
  List<DefinedCountry> otherCountries = [];
  bool _hasVignette = false;
  bool _hasTolls = false;
  bool _hasAustriaTolls = false;
  bool _hasSloveniaTolls = false;
  bool _hasSwitzerlandTolls = false;
  bool _hasHungaryTolls = false;
  bool _hasRomaniaTolls = false;
  bool _hasCzechTolls = false;
  bool _hasAustriaVignette = false;
  bool _hasSloveniaVignette = false;
  bool _hasSwitzerlandVignette = false;
  bool _hasHungaryVignette = false;
  bool _hasRomaniaVignette = false;
  bool _hasCzechVignette = false;

  @override
  void initState() {
    _focusNodeStartLocation.addListener(_handleFocusChange);
    _focusNodeDestination.addListener(_handleFocusDestinationChange);
    super.initState();
  }

  @override
  void dispose() {
    _startLocationController.dispose();
    _destinationController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _pageController.dispose();
    _focusNodeStartLocation.dispose();
    _focusNodeDestination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>()..add(GetAllVehiclesEvent()),
          lazy: false,
        ),
        BlocProvider(create: (context) => sl<GoogleMapsBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) async {
              if (state is ListRoutesLoadedState) {
                _listRoutes = state.listRoutes;
                gotoTrajectoryPage();
              } else if (state is ListVignetteLoadedState) {
                listVehicles = state.listVehicles;
              } else if (state is ListVignetteAndTollsLoadedFromRouteState) {
                _listVignetteAustria.addAll(state.austriaVignettesList);
                _listVignetteSlovenia.addAll(state.sloveniaVignettesList);
                _listVignetteSwitzerland.addAll(state.switzerlandVignettesList);
                _listVignetteHungary.addAll(state.hungaryVignetteList);
                _listVignetteRomania.addAll(state.romaniaVignetteList);
                _listVignetteCzech.addAll(state.czechVignetteList);
                _listTollsAustria = state.austriaTollsList;

                _hasTolls = state.hasTolls;
                _hasVignette = state.hasVignette;
                otherCountries = state.otherCountries;
                _hasAustriaTolls = state.hasAustriaTolls;
                _hasSloveniaTolls = state.hasSloveniaTolls;
                _hasSwitzerlandTolls = state.hasSwitzerlandTolls;
                _hasHungaryTolls = state.hasHungaryTolls;
                _hasRomaniaTolls = state.hasRomaniaTolls;
                _hasCzechTolls = state.hasCzechTolls;
                _hasSloveniaVignette = state.hasSloveniaVignette;
                _hasAustriaVignette = state.hasAustriaVignette;
                _hasSwitzerlandVignette = state.hasSwitzerlandVignette;
                _hasHungaryVignette = state.hasHungaryVignette;
                _hasRomaniaVignette = state.hasRomaniaVignette;
                _hasCzechVignette = state.hasCzechVignette;
                goToProductSelectionPage();
              } else if (state is FreeToolsAndVignetteState) {
                _listVignetteAustria = [];
                _listVignetteSlovenia = [];
                _listTollsAustria = [];
                _listVignetteSwitzerland = [];
                _listVignetteHungary = [];
                _listVignetteRomania = [];
                _listVignetteCzech = [];
                _hasSloveniaTolls = false;
                _hasAustriaTolls = false;
                _hasSwitzerlandTolls = false;
                _hasHungaryTolls = false;
                _hasRomaniaTolls = false;
                _hasCzechTolls = false;
                _hasVignette = state.hasVignette;
                _hasTolls = state.hasTolls;
                otherCountries = state.otherCountries;
                _hasSloveniaVignette = false;
                _hasAustriaVignette = false;
                _hasSwitzerlandVignette = false;
                _hasHungaryVignette = false;
                _hasRomaniaVignette = false;
                _hasCzechVignette = false;
                goToProductSelectionPage();
              } else if (state is ProductGruError) {
                handleTooGruError(gruError: state, context: context);
              } else if (state is ProductError) {
                handleProductError(context: context, productError: state);
              }
            },
          ),
          BlocListener<GoogleMapsBloc, GoogleMapsState>(
            listener: (context, state) async {},
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) async {
              if (state is ProductsAddedState) {
                goToLicensePlatformInformation(
                  context: context,
                  listItems: state.listItems,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, productBlocState) {
            if (productBlocState is VehicleLoadingState) {
              return const LoadingScreen();
            } else if (productBlocState is VehicleError) {
              return NoConnexionWidget(
                text: productBlocState.message,
                icon: (productBlocState.isIntentFailure)
                    ? Icons.cloud_off
                    : Icons.storage,
                tryAgain: () => getVehicles(context),
              );
            }
            return listVehicles.isNotEmpty
                ? PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CalculatorTabUi(
                        destinationController: _destinationController,
                        startLocationController: _startLocationController,
                        onSearch: () => calculatorOnSearch(context),
                        endDateController: _endDateController,
                        startDateController: _startDateController,
                        isFocusedDestination: _isFocusedDestination,
                        isFocusedStartLocation: _isFocusedStartLocation,
                        indexSelected: vehicleSelected.index,
                        isLoadingState:
                            (productBlocState is ProductGruLoadingState),
                        choseMoto: chooseMoto,
                        choseCar: chooseCar,
                        choseBas: chooseBas,
                        onChangedDestination: (value) =>
                            googleApiAutoCompleteSecondInput(
                                context: context, value: value),
                        onChangedStartLocation: (value) =>
                            googleApiAutoCompleteFirstInput(
                                context: context, value: value),
                        focusNodeDestination: _focusNodeDestination,
                        focusNodeStartLocation: _focusNodeStartLocation,
                        selectPredictionDestination:
                            selectPredictionDestination,
                        selectPredictionStartLocation:
                            selectPredictionStartLocation,
                        autoValdiate: autoValidate,
                        formKey: _calculatorFormKey,
                        destinationOnTap: destinationOnTap,
                        startLocationOnTap: startLocationOnTap,
                      ),
                      RouteTrajectoryUi(
                        backButtonOnTap: routeTrajectoryBackOButton,
                        indexSelected: indexTrajectory,
                        selectTrajectory: updateTrajectory,
                        listRoutes: _listRoutes,
                        isLoading: (productBlocState is ProductLoadingState),
                        nextButtonOnTap: () =>
                            routeTrajectoryNextButton(context),
                      ),
                      TollSelectionUi(
                        backButtonOnTap: tollSelectionBackOButton,
                        nextButtonOnTap: () => tollSelectionNextButton(context),
                        hasTolls: _hasTolls,
                        hasVignette: _hasVignette,
                        listVignetteSlovenia: _listVignetteSlovenia,
                        listVignetteAustria: _listVignetteAustria,
                        listVignetteSwitzerland: _listVignetteSwitzerland,
                        listVignetteHungary: _listVignetteHungary,
                        listVignetteRomania: _listVignetteRomania,
                        listVignetteCzech: _listVignetteCzech,
                        listTollsAustria: _listTollsAustria,
                        otherCountries: otherCountries,
                        hasAustriaTolls: _hasAustriaTolls,
                        hasSloveniaTolls: _hasSloveniaTolls,
                        hasSwitzerlandTolls: _hasSwitzerlandTolls,
                        hasHungaryTolls: _hasHungaryTolls,
                        hasRomaniaTolls: _hasRomaniaTolls,
                        hasCzechTolls: _hasCzechTolls,
                        hasAustriaVignette: _hasAustriaVignette,
                        hasSloveniaVignette: _hasSloveniaVignette,
                        hasSwitzerlandVignette: _hasSwitzerlandVignette,
                        hasHungaryVignette: _hasHungaryVignette,
                        hasRomaniaVignette: _hasRomaniaVignette,
                        hasCzechVignette: _hasCzechVignette,
                      ),
                    ],
                  )
                : const LoadingScreen();
          },
        ),
      ),
    );
  }

  void getVehicles(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(GetAllVehiclesEvent());
  }

  ////////////////////////////////// calculator //////////////////////////////////////////
  Future<void> calculatorOnSearch(BuildContext context) async {
    _focusNodeDestination.unfocus();
    _focusNodeStartLocation.unfocus();
    setState(() {
      autoValidate = true;
    });
    if (_calculatorFormKey.currentState?.validate() ?? false) {
      if (endDateIsBiggerThanStartDate(
          startDate: _startDateController.text,
          endDate: _endDateController.text)) {
        BlocProvider.of<ProductBloc>(context).add(
          GetRoutesEvent(
            start: _startLocationController.text,
            destination: _destinationController.text,
            destinationLocationId: destinationId,
            startLocationId: startLocationId,
          ),
        );
      } else {
        await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.one_option_dialog_title.tr(),
          confirmButtonText: LocaleKeys.one_option_dialog_button_text.tr(),
          content: LocaleKeys.one_option_dialog_date_error.tr(),
        );
      }
    }
  }

  void googleApiAutoCompleteFirstInput(
      {required BuildContext context, required String value}) {
    if (_startLocationController.text.isNotEmpty) {
      BlocProvider.of<GoogleMapsBloc>(context).add(
        GetLocationPredictionsEvent(
            languageCode: getLocaleLanguageCode(context),
            text: _startLocationController.text),
      );
    }
  }

  void googleApiAutoCompleteSecondInput(
      {required BuildContext context, required String value}) {
    if (_destinationController.text.isNotEmpty) {
      BlocProvider.of<GoogleMapsBloc>(context).add(
        GetLocationPredictionsSecondInputEvent(
            languageCode: getLocaleLanguageCode(context),
            text: _destinationController.text),
      );
    }
  }

  void _handleFocusChange() {
    setState(() {
      _isFocusedStartLocation = _focusNodeStartLocation.hasFocus;
    });
  }

  void _handleFocusDestinationChange() {
    setState(() {
      _isFocusedDestination = _focusNodeDestination.hasFocus;
    });
  }

  void selectPredictionDestination(
      PredictionModel predictionModel, BuildContext context) {
    setState(() {
      destinationId = predictionModel.placeId;
    });
    _destinationController.text = predictionModel.description ?? "";
    _focusNodeDestination.unfocus();
  }

  void selectPredictionStartLocation(
      PredictionModel predictionModel, BuildContext context) {
    setState(() {
      startLocationId = predictionModel.placeId;
    });
    _startLocationController.text = predictionModel.description ?? "";
    _focusNodeStartLocation.unfocus();
  }

  void gotoTrajectoryPage() {
    _pageController.jumpToPage(CalculatorPageEnum.trajectory.index);
  }

  void chooseMoto() {
    setState(() {
      vehicleSelected = VehicleEnum.moto;
    });
  }

  void chooseCar() {
    setState(() {
      vehicleSelected = VehicleEnum.car;
    });
  }

  void chooseBas() {
    setState(() {
      vehicleSelected = VehicleEnum.truck;
    });
  }

  void destinationOnTap() {
    setState(() {
      destinationId = null;
    });
  }

  void startLocationOnTap() {
    setState(() {
      startLocationId = null;
    });
  }

  Future<void> handleTooGruError({
    required ProductGruError gruError,
    required BuildContext context,
  }) async {
    if (gruError.isIntentFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        BlocProvider.of<ProductBloc>(context).add(
          GetRoutesEvent(
            start: _startLocationController.text,
            destination: _destinationController.text,
            destinationLocationId: destinationId,
            startLocationId: startLocationId,
          ),
        );
      }
    } else if (gruError.undefinedCountryFailure) {
      await DialogUtils.showOKDialog(
        context: context,
        title: LocaleKeys.one_option_dialog_title.tr(),
        confirmButtonText: LocaleKeys.one_option_dialog_button_text.tr(),
        content: gruError.message,
      );
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        BlocProvider.of<ProductBloc>(context).add(
          GetRoutesEvent(
            start: _startLocationController.text,
            destination: _destinationController.text,
            destinationLocationId: destinationId,
            startLocationId: startLocationId,
          ),
        );
      }
    }
  }

  Future<void> handleProductError({
    required ProductError productError,
    required BuildContext context,
  }) async {
    if (productError.isIntentFailure) {
      final result = await DialogUtils.showNoInternetDialog(
        context: context,
      );
      if (result) {
        routeTrajectoryNextButton(context);
      }
    } else {
      final result = await DialogUtils.showServerErrorDialog(
        context: context,
      );
      if (result) {
        routeTrajectoryNextButton(context);
      }
    }
  }

  ////////////////////////////////// Trajectory //////////////////////////

  void routeTrajectoryBackOButton() {
    indexTrajectory = 0;
    _listRoutes = [];
    _pageController.jumpToPage(CalculatorPageEnum.calculator.index);
  }

  void routeTrajectoryNextButton(BuildContext context) {
    if (_listRoutes.isNotEmpty) {
      BlocProvider.of<ProductBloc>(context).add(
        GetVignetteAndTollsEvent(
          tollRoutesModel: _listRoutes[indexTrajectory],
          dateEnd: convertDateFormat(_endDateController.text),
          dateStart: convertDateFormat(_startDateController.text),
          vehicleId: getVehiclesIdFromType(
            vehicleSelected.name,
            listVehicles,
          ),
        ),
      );
    }
  }

  void goToProductSelectionPage() {
    _pageController.jumpToPage(CalculatorPageEnum.tolls.index);
  }

  void updateTrajectory(int newValue) {
    setState(() {
      indexTrajectory = newValue;
    });
  }

  //toll Selection

  void tollSelectionBackOButton() {
    cleanListsProducts();
    _pageController.jumpToPage(CalculatorPageEnum.trajectory.index);
  }

  Future<void> tollSelectionNextButton(BuildContext context) async {
    List<VignetteProduct> inPut = [];
    inPut.addAll(_listVignetteAustria);
    inPut.addAll(_listTollsAustria);
    inPut.addAll(_listVignetteSlovenia);
    inPut.addAll(_listVignetteSwitzerland);
    inPut.addAll(_listVignetteHungary);
    inPut.addAll(_listVignetteRomania);
    inPut.addAll(_listVignetteCzech);
    List<CartModel> outPut = getAllCartModelFromProductList(
      vehicleType: vehicleSelected.name,
      dateEnd: convertDateFormat(_endDateController.text),
      dateStart: convertDateFormat(_startDateController.text),
      vehicleId: getVehiclesIdFromType(vehicleSelected.name, listVehicles),
      tollGruDuration: _listRoutes[indexTrajectory].summary?.duration?.text,
      googleUrl: _listRoutes[indexTrajectory].summary?.url,
      countries: _listRoutes[indexTrajectory].summary?.countries,
      listProduct: inPut,
    );
    if (outPut.isNotEmpty) {
      final result = await DialogUtils.continueToCheckoutDialog(
        context: context,
      );
      if (result) {
        BlocProvider.of<CartBloc>(context).add(
          AddProductsEvent(listProducts: outPut, isFromHome: false),
        );
      }
    } else {
      await DialogUtils.showOKDialog(
          context: context,
          title: LocaleKeys.toll_selection_dialog_title.tr(),
          confirmButtonText: LocaleKeys.toll_selection_confirm_dialog.tr(),
          content: LocaleKeys.toll_selection_select_something.tr());
    }
  }

  void goToLicensePlatformInformation({
    required BuildContext context,
    required List<CartModel> listItems,
  }) {
    Navigator.pushNamed(
      context,
      licensePlatformInformation,
      arguments: listItems,
    );
  }

  void cleanListsProducts() {
    setState(() {
      _listVignetteAustria = [];
      _listVignetteSlovenia = [];
      _listTollsAustria = [];
      _listVignetteSwitzerland = [];
      _listVignetteHungary = [];
      _listVignetteRomania = [];
      _listVignetteCzech = [];
      otherCountries = [];
      _hasVignette = false;
      _hasTolls = false;
      _hasAustriaTolls = false;
      _hasSloveniaTolls = false;
      _hasSwitzerlandTolls = false;
      _hasHungaryTolls = false;
      _hasRomaniaTolls = false;
      _hasCzechTolls = false;
      _hasSloveniaVignette = false;
      _hasAustriaVignette = false;
      _hasSwitzerlandVignette = false;
      _hasHungaryVignette = false;
      _hasRomaniaVignette = false;
      _hasCzechVignette = false;
    });
  }
}
