import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class FormValidator {
  static String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return LocaleKeys.validation_password.tr();
    }
    return null; // Return null if the value is valid
  }

  static String? validateGender(UserGender? value) {
    if (value == null) {
      return LocaleKeys.validation_validate_gender.tr();
    }
    return null; // Return null if the value is valid
  }

  static String? validateRequiredFields(String? value) {
    if (value?.isEmpty == true) {
      return LocaleKeys.validation_required_filed.tr();
    }
    return null; // Return null if the value is valid
  }

  static String? validateRequiredFieldsWithoutMessage(String? value) {
    if (value?.isEmpty == true) {
      return "";
    }
    return null; // Return null if the value is valid
  }

  static String? validateDateStartAndDateEnd(
      String? startValue, String? endValue) {
    if (startValue?.isEmpty == true) {
      return "";
    }
    return null; // Return null if the value is valid
  }

  static String? validateMisMatchFields(String? value) {
    if (value?.isEmpty == true) {
      return LocaleKeys.validation_password_misMatch.tr();
    }
    return null; // Return null if the value is valid
  }

  static String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return LocaleKeys.validation_email.tr();
    }
    if (!isValidEmail(value ?? "")) {
      return LocaleKeys.validation_email.tr();
    }
    return null;
  }

  static String? validateConfirmationEmail({
    required TextEditingController current,
    required TextEditingController other,
  }) {
    if (!isValidEmail(other.text) || other.text.isEmpty == true) {
      return null;
    }
    if (!isValidEmail(current.text) || current.text != other.text) {
      return LocaleKeys.validation_email.tr();
    }
    return null;
  }

  static bool isValidEmail(String value) {
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(value);
  }

  static String? validateConfirmationPassword({
    required TextEditingController current,
    required TextEditingController other,
  }) {
    if (current.text.isEmpty == true) {
      return LocaleKeys.validation_password.tr();
    }
    if (current.text != other.text) {
      return LocaleKeys.validation_password_misMatch.tr();
    }
    return null;
  }
}
