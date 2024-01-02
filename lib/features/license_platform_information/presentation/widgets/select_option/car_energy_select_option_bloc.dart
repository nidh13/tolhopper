import 'package:flutter/material.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/select_option/car_energie_enum.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/select_option/car_energie_select_option.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';

class CarEnergySelectOptionBloc extends StatelessWidget {
  final String title;
  final CarEnergyEnum? carEnergyEnum;
  final void Function(CarEnergyEnum?) changeType;
  final bool autoVal;
  final String hint;
  const CarEnergySelectOptionBloc(
      {Key? key,
      required this.title,
      required this.carEnergyEnum,
      required this.changeType,
      required this.hint,
      required this.autoVal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormTitle(title: title),
          CarEnergySelectOption(
            changeType: changeType,
            autoVal: autoVal,
            hint: hint,
            carEnergyEnum: carEnergyEnum,
          )
        ],
      ),
    );
  }
}
