import 'package:easy_localization/easy_localization.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

enum CarEnergyEnum {
  gasoline,
  diesel,
  electric,
  hybrid,
  pluginHybrid,
  hydrogen,
}

extension CarEnergyEnumExtension on CarEnergyEnum {
  String get title {
    switch (this) {
      case CarEnergyEnum.gasoline:
        return LocaleKeys.car_energy_gasoline.tr();
      case CarEnergyEnum.diesel:
        return LocaleKeys.car_energy_diesel.tr();
      case CarEnergyEnum.electric:
        return LocaleKeys.car_energy_electric.tr();
      case CarEnergyEnum.hybrid:
        return LocaleKeys.car_energy_hybrid.tr();
      case CarEnergyEnum.pluginHybrid:
        return LocaleKeys.car_energy_pluginHybrid.tr();
      case CarEnergyEnum.hydrogen:
        return LocaleKeys.car_energy_hydrogen.tr();
    }
  }
}

CarEnergyEnum getCarEnergyEnumFromString(String carEnergy) =>
    CarEnergyEnum.values.firstWhere((f) => f.name == carEnergy,
        orElse: () => CarEnergyEnum.gasoline);
