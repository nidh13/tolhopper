import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/validator/form_validator.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/auto_complete_filed.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/chose_vehicle_type.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/date_picker/common_date_picker_bloc.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_bloc.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';
import 'package:tollhopper/global/google_map_bloc/presentation/bloc/google_maps_bloc.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class CalculatorTabUi extends StatelessWidget {
  final VoidCallback? onSearch;
  final TextEditingController startLocationController;
  final TextEditingController destinationController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final GestureTapCallback? choseCar;
  final GestureTapCallback? choseMoto;
  final GestureTapCallback? choseBas;
  final int indexSelected;
  final bool isLoadingState;
  final bool isFocusedStartLocation;
  final bool isFocusedDestination;
  final ValueChanged<String>? onChangedStartLocation;
  final ValueChanged<String>? onChangedDestination;
  final FocusNode? focusNodeStartLocation;
  final FocusNode? focusNodeDestination;
  final void Function(PredictionModel, BuildContext)
      selectPredictionStartLocation;
  final void Function(PredictionModel, BuildContext)
      selectPredictionDestination;
  final GlobalKey formKey;
  final bool autoValdiate;
  final GestureTapCallback? destinationOnTap;
  final GestureTapCallback? startLocationOnTap;
  const CalculatorTabUi(
      {Key? key,
      required this.onSearch,
      required this.destinationController,
      required this.startLocationController,
      required this.endDateController,
      required this.startDateController,
      required this.indexSelected,
      required this.choseCar,
      required this.choseBas,
      required this.isLoadingState,
      required this.choseMoto,
      required this.onChangedStartLocation,
      required this.onChangedDestination,
      required this.isFocusedDestination,
      required this.isFocusedStartLocation,
      required this.focusNodeDestination,
      required this.focusNodeStartLocation,
      required this.autoValdiate,
      required this.formKey,
      required this.selectPredictionDestination,
      required this.selectPredictionStartLocation,
      required this.destinationOnTap,
      required this.startLocationOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: globalBackgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: CommonAppBar(
            title: LocaleKeys.calculator_tab_app_bar_title.tr(),
          ),
          body: Form(
            key: formKey,
            autovalidateMode: autoValdiate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
              child: Column(
                children: [
                  BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
                    builder: (context, state) {
                      return Expanded(
                          child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextFormBloc(
                                controller: startLocationController,
                                hint: LocaleKeys.route_plan_input_hint.tr(),
                                title: LocaleKeys.calculator_tab_start.tr(),
                                prefixIcon: positionIcon,
                                prefixIconColor: homeGerySubTitleColor,
                                onChanged: onChangedStartLocation,
                                prefixIconHeight: 18,
                                prefixIconWidth: 15,
                                focusNode: focusNodeStartLocation,
                                hasPaddingBottom: false,
                                onTap: startLocationOnTap,
                                validateData: FormValidator
                                    .validateRequiredFieldsWithoutMessage,
                                showErrorText: false,
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        CommonTextFormBloc(
                                          controller: destinationController,
                                          hint: LocaleKeys.route_plan_input_hint
                                              .tr(),
                                          title: LocaleKeys
                                              .calculator_tab_destination
                                              .tr(),
                                          onTap: destinationOnTap,
                                          prefixIcon: positionIcon,
                                          focusNode: focusNodeDestination,
                                          hasPaddingBottom: false,
                                          prefixIconColor:
                                              homeGerySubTitleColor,
                                          onChanged: onChangedDestination,
                                          prefixIconHeight: 18,
                                          prefixIconWidth: 15,
                                          validateData: FormValidator
                                              .validateRequiredFieldsWithoutMessage,
                                          showErrorText: false,
                                        ),
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            CommonDatePickerBloc(
                                                          controller:
                                                              startDateController,
                                                          hint: LocaleKeys
                                                              .calculator_tab_select_date_hint
                                                              .tr(),
                                                          title: LocaleKeys
                                                              .calculator_tab_start_date
                                                              .tr(),
                                                          validateData:
                                                              FormValidator
                                                                  .validateRequiredFieldsWithoutMessage,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            CommonDatePickerBloc(
                                                          controller:
                                                              endDateController,
                                                          hint: LocaleKeys
                                                              .calculator_tab_select_date_hint
                                                              .tr(),
                                                          title: LocaleKeys
                                                              .calculator_tab_end_date
                                                              .tr(),
                                                          validateData:
                                                              FormValidator
                                                                  .validateRequiredFieldsWithoutMessage,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ChooseVehicleType(
                                                      title: LocaleKeys
                                                          .calculator_tab_select_car_hint
                                                          .tr(),
                                                      choseCar: choseCar,
                                                      choseMoto: choseMoto,
                                                      choseBas: choseBas,
                                                      indexSelected:
                                                          indexSelected),
                                                ],
                                              ),
                                            ),
                                            isFocusedDestination
                                                ? AutoComplete(
                                                    showList: (state
                                                        is ListPredictionsSecondInputState),
                                                    listPredictions: (state
                                                            is ListPredictionsSecondInputState)
                                                        ? state.listPredictions
                                                        : [],
                                                    isLoading: (state
                                                        is GoogleMapsSecondInputLoadingState),
                                                    selectPrediction:
                                                        selectPredictionDestination,
                                                  )
                                                : const SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  isFocusedStartLocation
                                      ? AutoComplete(
                                          showList: (state
                                              is ListPredictionsFirstInputState),
                                          listPredictions: (state
                                                  is ListPredictionsFirstInputState)
                                              ? state.listPredictions
                                              : [],
                                          isLoading: (state
                                              is GoogleMapsFirstInputLoadingState),
                                          selectPrediction:
                                              selectPredictionStartLocation,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                  isLoadingState
                      ? const LoadingScreen()
                      : GlobalAppButton(
                          text: LocaleKeys.route_plan_search.tr(),
                          onPressed: onSearch,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
