import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tollhopper/global/utils/const.dart';

part 'license_plate_event.dart';
part 'license_plate_state.dart';

class LicensePlateBloc extends Bloc<LicensePlateEvent, LicensePlateState> {
  LicensePlateBloc() : super(LicensePlateState(countryCode: germanyCountry)) {
    on<ChangeCountryLicensePlateEvent>(_changeCountryLicenseEvent);
    on<FirstLicensePlateEvent>(_firstLicensePlateEvent);
    on<SecondLicensePlateEvent>(_secondLicensePlateEvent);
    on<ThirdLicensePlateEvent>(_thirdLicensePlateEvent);
    on<ConfirmFirstLicensePlateEvent>(_confirmFirstLicensePlateEvent);
    on<ConfirmSecondLicensePlateEvent>(_confirmSecondLicensePlateEvent);
    on<ConfirmThirdLicensePlateEvent>(_confirmThirdLicensePlateEvent);
  }

  void _firstLicensePlateEvent(
      FirstLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(firstLicensePate: event.firstLicenseValue));
  }

  void _secondLicensePlateEvent(
      SecondLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(secondLicensePate: event.secondLicenseValue));
  }

  void _thirdLicensePlateEvent(
      ThirdLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(thirdLicensePate: event.thirdLicenseValue));
  }

  void _confirmFirstLicensePlateEvent(
      ConfirmFirstLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(
        confirmFirstLicensePate: event.confirmFirstLicenseValue));
  }

  void _confirmSecondLicensePlateEvent(
      ConfirmSecondLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(
        confirmSecondLicensePate: event.confirmSecondLicenseValue));
  }

  void _confirmThirdLicensePlateEvent(
      ConfirmThirdLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(state.copyWith(
        confirmThirdLicensePate: event.confirmThirdLicenseValue));
  }

  void _changeCountryLicenseEvent(
      ChangeCountryLicensePlateEvent event, Emitter<LicensePlateState> emit) {
    emit(
      state.copyWith(
        countryCode: event.countryCode,
        firstLicensePate: '',
        secondLicensePate: '',
        thirdLicensePate: '',
        confirmFirstLicensePate: '',
        confirmSecondLicensePate: '',
        confirmThirdLicensePate: '',
      ),
    );
  }
}
