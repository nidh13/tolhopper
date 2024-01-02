import 'package:flutter/material.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/radio_enum/vehicle_enum.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/vehicle_icon.dart';
import 'package:tollhopper/global/assets/icons.dart';

class ChoseVehicleTypeGroup extends StatelessWidget {
  final GestureTapCallback? choseCar;
  final GestureTapCallback? choseBas;
  final GestureTapCallback? choseMoto;
  final int indexSelected;
  const ChoseVehicleTypeGroup(
      {Key? key,
      required this.indexSelected,
      required this.choseBas,
      required this.choseCar,
      required this.choseMoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VehicleIcon(
          icon: carIcon,
          isSelected: (indexSelected == VehicleEnum.car.index),
          onTap: choseCar,
        ),
        const SizedBox(
          width: 5,
        ),
        VehicleIcon(
          icon: motoIcon,
          isSelected: (indexSelected == VehicleEnum.moto.index),
          onTap: choseMoto,
        ),
        const SizedBox(
          width: 5,
        ),
        VehicleIcon(
          icon: basIcon,
          isSelected: (indexSelected == VehicleEnum.truck.index),
          onTap: choseBas,
        ),
      ],
    );
  }
}
