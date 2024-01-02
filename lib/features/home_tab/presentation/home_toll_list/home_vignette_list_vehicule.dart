import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/radio_enum/vehicle_enum.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_calculator/widgets/vehicle_icon.dart';

class HomeVignetteListVehicule extends StatelessWidget {
  final List<VignetteProductPrices> prices;
  final int indexSelected;
  final Function(int) changeIndexSelected;
  const HomeVignetteListVehicule(
      {Key? key,
      required this.prices,
      required this.indexSelected,
      required this.changeIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
            itemCount: prices.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              VehicleEnum getVehicle =
                  getVehicleEnumFromString(prices[index].vehicle?.type ?? "");
              return VehicleIcon(
                icon: getVehicle.icon,
                isSelected: indexSelected == index,
                onTap: () => changeIndexSelected(index),
              );
            }),
      ),
    );
  }
}
