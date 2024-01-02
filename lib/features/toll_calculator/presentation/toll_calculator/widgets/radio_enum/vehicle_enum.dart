import 'package:tollhopper/global/assets/icons.dart';

enum VehicleEnum {
  car,
  moto,
  truck,
}

extension VehicleEnumExtension on VehicleEnum {
  String get icon {
    switch (this) {
      case VehicleEnum.car:
        return carIcon;
      case VehicleEnum.moto:
        return motoIcon;
      case VehicleEnum.truck:
        return basIcon;
    }
  }
}

VehicleEnum getVehicleEnumFromString(String vehicle) => VehicleEnum.values
    .firstWhere((f) => f.name == vehicle, orElse: () => VehicleEnum.car);
