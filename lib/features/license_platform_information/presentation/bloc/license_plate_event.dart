part of 'license_plate_bloc.dart';

@immutable
abstract class LicensePlateEvent {
  const LicensePlateEvent();
}

class ChangeCountryLicensePlateEvent extends LicensePlateEvent {
  final CountryCode? countryCode;

  const ChangeCountryLicensePlateEvent({
    this.countryCode,
  });
}

class FirstLicensePlateEvent extends LicensePlateEvent {
  final String firstLicenseValue;

  const FirstLicensePlateEvent(this.firstLicenseValue);
}

class SecondLicensePlateEvent extends LicensePlateEvent {
  final String secondLicenseValue;

  const SecondLicensePlateEvent(this.secondLicenseValue);
}

class ThirdLicensePlateEvent extends LicensePlateEvent {
  final String thirdLicenseValue;

  const ThirdLicensePlateEvent(this.thirdLicenseValue);
}

class ConfirmFirstLicensePlateEvent extends LicensePlateEvent {
  final String confirmFirstLicenseValue;

  const ConfirmFirstLicensePlateEvent(this.confirmFirstLicenseValue);
}

class ConfirmSecondLicensePlateEvent extends LicensePlateEvent {
  final String confirmSecondLicenseValue;

  const ConfirmSecondLicensePlateEvent(this.confirmSecondLicenseValue);
}

class ConfirmThirdLicensePlateEvent extends LicensePlateEvent {
  final String confirmThirdLicenseValue;

  const ConfirmThirdLicensePlateEvent(this.confirmThirdLicenseValue);
}
