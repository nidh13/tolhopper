part of 'license_plate_bloc.dart';

class LicensePlateState {
  final CountryCode countryCode;
  final String firstLicensePate;
  final String secondLicensePate;
  final String thirdLicensePate;
  final String confirmFirstLicensePate;
  final String confirmSecondLicensePate;
  final String confirmThirdLicensePate;

  const LicensePlateState({
    required this.countryCode,
    this.firstLicensePate = '',
    this.secondLicensePate = '',
    this.thirdLicensePate = '',
    this.confirmFirstLicensePate = '',
    this.confirmSecondLicensePate = '',
    this.confirmThirdLicensePate = '',
  });

  LicensePlateState copyWith({
    String? firstLicensePate,
    String? secondLicensePate,
    String? thirdLicensePate,
    String? confirmFirstLicensePate,
    String? confirmSecondLicensePate,
    String? confirmThirdLicensePate,
    CountryCode? countryCode,
  }) {
    return LicensePlateState(
      firstLicensePate: firstLicensePate ?? this.firstLicensePate,
      secondLicensePate: secondLicensePate ?? this.secondLicensePate,
      thirdLicensePate: thirdLicensePate ?? this.thirdLicensePate,
      confirmFirstLicensePate:
          confirmFirstLicensePate ?? this.confirmFirstLicensePate,
      confirmSecondLicensePate:
          confirmSecondLicensePate ?? this.confirmSecondLicensePate,
      confirmThirdLicensePate:
          confirmThirdLicensePate ?? this.confirmThirdLicensePate,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
