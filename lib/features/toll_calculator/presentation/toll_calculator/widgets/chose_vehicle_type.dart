import 'package:flutter/material.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/chose_vehicle_type_group.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_title.dart';

class ChooseVehicleType extends StatelessWidget {
  final String title;
  final GestureTapCallback? choseCar;
  final GestureTapCallback? choseMoto;
  final GestureTapCallback? choseBas;
  final int indexSelected;
  const ChooseVehicleType(
      {Key? key,
      required this.title,
      required this.indexSelected,
      required this.choseCar,
      required this.choseMoto,
      required this.choseBas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormTitle(title: title),
          const SizedBox(
            height: 4,
          ),
          ChoseVehicleTypeGroup(
            choseCar: choseCar,
            choseMoto: choseMoto,
            choseBas: choseBas,
            indexSelected: indexSelected,
          ),
        ],
      ),
    );
  }
}
