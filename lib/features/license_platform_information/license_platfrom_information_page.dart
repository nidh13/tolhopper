import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/cart_tab/presentation/bloc/cart_bloc.dart';
import 'package:tollhopper/features/license_platform_information/presentation/bloc/license_plate_bloc.dart';
import 'package:tollhopper/features/license_platform_information/presentation/license_plate_information_ui.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/select_option/car_energie_enum.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/login_pop_up/login_pop_up_page.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:tollhopper/global/utils/pate_license_validation.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';

class LicensePlatformInformationPage extends StatefulWidget {
  const LicensePlatformInformationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LicensePlatformInformationPage> createState() =>
      _LicensePlatformInformationPageState();
}

class _LicensePlatformInformationPageState
    extends State<LicensePlatformInformationPage> {
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _pateInformationFirstController =
      TextEditingController();
  final TextEditingController _pateInformationSecondController =
      TextEditingController();
  final TextEditingController _pateInformationThirdController =
      TextEditingController();
  final TextEditingController _confirmPateInformationFirstController =
      TextEditingController();
  final TextEditingController _confirmPateInformationSecondController =
      TextEditingController();
  final TextEditingController _confirmPateInformationThirdController =
      TextEditingController();
  final TextEditingController _carNameController = TextEditingController();
  CarEnergyEnum? carEnergyEnum;
  CountryCode? countrySelected = CountryCode.fromCountryCode(germanyCode);
  List<CartModel> _cart = [];

  bool firstInputIsValid = false;

  String firstInputValidationText = "";

  bool secondInputIsValid = false;

  String secondInputValidationText = "";

  bool autValidate = false;

  bool showChasseNumber = false;

  String? userToken;

  @override
  void initState() {
    LicensePlateState state = sl<LicensePlateBloc>().state;
    _pateInformationFirstController.text = state.firstLicensePate;
    _pateInformationSecondController.text = state.secondLicensePate;
    _pateInformationThirdController.text = state.thirdLicensePate;
    _confirmPateInformationFirstController.text = state.confirmFirstLicensePate;
    _confirmPateInformationSecondController.text =
        state.confirmSecondLicensePate;
    _confirmPateInformationThirdController.text = state.confirmThirdLicensePate;
    if (state.countryCode != countrySelected) {
      countrySelected = state.countryCode;
    }
    super.initState();
  }

  @override
  void dispose() {
    _carModelController.dispose();
    _pateInformationFirstController.dispose();
    _pateInformationSecondController.dispose();
    _pateInformationThirdController.dispose();
    _confirmPateInformationFirstController.dispose();
    _confirmPateInformationSecondController.dispose();
    _confirmPateInformationThirdController.dispose();
    _carNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SignInBloc>()..add(GetUserTokenEvent()),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>()..add(GetProductsFromCartEvent()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) async {
              if (state is UserTokenState) {
                userToken = state.token;
              }
            },
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) async {
              if (state is CartSuccessState) {
                _cart = state.listItems;
              }
            },
          ),
        ],
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return LicensePlateInformation(
              nextButtonOnTap: () =>
                  pateInformationNextButton(context: context),
              backButtonOnTap: pateInformationBackOButton,
              country: countrySelected,
              carNameController: _carNameController,
              carModelController: _carModelController,
              pateInformationFirstController: _pateInformationFirstController,
              pateInformationSecondController: _pateInformationSecondController,
              pateInformationThirdController: _pateInformationThirdController,
              countryChange: pateInformationChangeCountry,
              carEnergyEnum: carEnergyEnum,
              changeEnergyType: pateInformationChangeCarEnergy,
              confirmPateInformationFirstController:
                  _confirmPateInformationFirstController,
              confirmPateInformationSecondController:
                  _confirmPateInformationSecondController,
              confirmPateInformationThirdController:
                  _confirmPateInformationThirdController,
              firstPateIsValid: autValidate ? firstInputIsValid : true,
              firstPateValidationText: firstInputValidationText,
              secondPateIsValid: autValidate
                  ? firstInputIsValid
                      ? secondInputIsValid
                      : true
                  : true,
              secondPateValidationText: secondInputValidationText,
            );
          },
        ),
      ),
    );
  }

  // Pate Information
  void pateInformationBackOButton() {
    Navigator.of(context).pop();
  }

  Future<void> pateInformationNextButton({
    required BuildContext context,
  }) async {
    openValidation();
    validateFirstPateInformation();
    validateSecondInformation();
    if (firstInputIsValid && secondInputIsValid) {
      if (userToken != null) {
        goToContactInformationPage(context);
      } else {
        final blocInstance = context.read<SignInBloc>();
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context2) {
            return BlocProvider.value(
                value: blocInstance, child: const LoginPopUpPage());
          },
        ).then((value) {
          if (value != null) {
            String returnedValue = value as String;
            if (returnedValue == "") {
              goToContactInformationPage(context);
            } else {
              setState(() {
                userToken = returnedValue;
              });
              goToContactInformationPage(context);
            }
          }
        });
      }
    }
  }

  void goToContactInformationPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      contactInformationPage,
      arguments: ContactInformationParams(
        isConnected: (userToken != null && (userToken?.isNotEmpty == true)),
        token: userToken ?? "",
        countryLicencePate: correctCountryCode(countrySelected?.code ?? ""),
        licencePate: getFullTextPateLicense(
          firstInput: _pateInformationFirstController.text,
          secondInput: _pateInformationSecondController.text,
          lastInput: _pateInformationThirdController.text,
          countryCode: countrySelected?.code ?? "",
        ),
        licencePateRegEx: getFullTextPateLicenseRegEx(
          firstInput: _pateInformationFirstController.text,
          secondInput: _pateInformationSecondController.text,
          lastInput: _pateInformationThirdController.text,
        ),
      ),
    );
  }

  void pateInformationChangeCountry(CountryCode? country) {
    setState(() {
      if (country != null) {
        countrySelected = CountryCode.fromDialCode(country.toString());
        _pateInformationFirstController.text = "";
        _pateInformationSecondController.text = "";
        _pateInformationThirdController.text = "";
        _confirmPateInformationFirstController.text = "";
        _confirmPateInformationSecondController.text = "";
        _confirmPateInformationThirdController.text = "";

        sl<LicensePlateBloc>()
            .add(ChangeCountryLicensePlateEvent(countryCode: countrySelected));
      }
    });
  }

  void pateInformationChangeCarEnergy(CarEnergyEnum? value) {
    setState(() {
      if (value != null) {
        carEnergyEnum = value;
      }
    });
  }

  void validateFirstPateInformation() {
    setState(() {
      firstInputIsValid = isValidCountryPateLicense(
          countryCode: countrySelected?.code ?? "",
          firstInput: _pateInformationFirstController.text,
          lastInput: _pateInformationThirdController.text,
          secondInput: _pateInformationSecondController.text);
    });
    if (firstInputIsValid) {
      firstInputValidationText = "";
    } else {
      if (_pateInformationFirstController.text.isEmpty &&
          _pateInformationThirdController.text.isEmpty &&
          _pateInformationSecondController.text.isEmpty) {
        setState(() {
          firstInputValidationText =
              LocaleKeys.license_information_first_put_empty.tr();
        });
      } else {
        setState(() {
          firstInputValidationText =
              LocaleKeys.license_information_first_put_invalid.tr();
        });
      }
    }
  }

  void validateSecondInformation() {
    final fullFirstPateText = getFullTextPateLicense(
        firstInput: _pateInformationFirstController.text,
        secondInput: _pateInformationSecondController.text,
        lastInput: _pateInformationThirdController.text,
        countryCode: countrySelected?.code ?? "");
    final fullSecondPateText = getFullTextPateLicense(
        firstInput: _confirmPateInformationFirstController.text,
        secondInput: _confirmPateInformationSecondController.text,
        lastInput: _confirmPateInformationThirdController.text,
        countryCode: countrySelected?.code ?? "");
    if (fullFirstPateText == fullSecondPateText) {
      setState(() {
        secondInputIsValid = true;
      });
    } else {
      setState(() {
        secondInputIsValid = false;
      });
      if (_confirmPateInformationFirstController.text.isEmpty &&
          _confirmPateInformationSecondController.text.isEmpty &&
          _confirmPateInformationThirdController.text.isEmpty) {
        setState(() {
          secondInputValidationText =
              LocaleKeys.license_information_second_put_empty.tr();
        });
      } else {
        setState(() {
          secondInputValidationText =
              LocaleKeys.license_information_second_put_invalid.tr();
        });
      }
    }
  }

  void openValidation() {
    if (autValidate == false) {
      setState(() {
        autValidate = true;
      });
    }
  }
}
