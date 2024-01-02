import 'package:flutter/material.dart';
import 'package:tollhopper/features/license_platform_information/presentation/widgets/select_option/car_energie_enum.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CarEnergySelectOption extends StatelessWidget {
  final CarEnergyEnum? carEnergyEnum;
  final void Function(CarEnergyEnum?) changeType;
  final bool autoVal;
  final String hint;
  const CarEnergySelectOption(
      {Key? key,
      required this.carEnergyEnum,
      required this.autoVal,
      required this.hint,
      required this.changeType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 50,
      child: DropdownButtonFormField(
        value: carEnergyEnum,
        isExpanded: true,
        onChanged: changeType,
        icon: Icon(
          Icons.arrow_drop_down,
          size: 25,
          color: (carEnergyEnum != null)
              ? geryTextLoginInputColor
              : geryHintLoginInputColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: globalBackgroundColor,
          hintText: hint,
          hintStyle:
              theme.textTheme.headline5?.copyWith(color: homeGerySubTitleColor),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
                color: globalTextFormFiledBorderColor,
                width: 1), // Border color and width
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
                color: globalTextFormFiledBorderColor,
                width: 1), // Border color and width
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
                color: appPrimaryColor,
                width: 1), // Focus border color and width
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            borderSide: BorderSide(
                color: redErrorLoginInputColor,
                width: 1), // Error border color and width
          ),
          errorStyle: theme.textTheme.headline5
              ?.copyWith(color: redErrorLoginInputColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        items: CarEnergyEnum.values
            .map<DropdownMenuItem<CarEnergyEnum>>((CarEnergyEnum values) {
          return DropdownMenuItem<CarEnergyEnum>(
            value: values,
            child: Text(
              values.title,
              style: theme.textTheme.headline5,
            ),
          );
        }).toList(),
      ),
    );
  }
}
