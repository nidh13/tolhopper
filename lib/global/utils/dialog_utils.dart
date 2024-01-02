import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/home_tab/presentation/home_toll_list/select_date_dialog.dart';
import 'package:tollhopper/features/home_tab/presentation/home_toll_list/select_toll_dialog.dart';
import 'package:tollhopper/global/common_widgets/dialogs/one_option_dialog.dart';
import 'package:tollhopper/global/common_widgets/dialogs/two_option_dialog.dart';
import 'package:tollhopper/global/common_widgets/dialogs/two_option_dialog_with_icon.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class DialogUtils {
  static Future<bool> showLogoutDialog({
    required BuildContext context,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppTwoOptionDialog(
          content: LocaleKeys.log_out_pop_up_content.tr(),
          confirmButtonText: LocaleKeys.log_out_pop_up_confirm_text.tr(),
          disableButtonText: LocaleKeys.log_out_pop_up_cancel_text.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }

  static Future<void> showOKDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String confirmButtonText}) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppOneOptionDialog(
          content: content,
          confirmButtonText: confirmButtonText,
          title: title,
        );
      },
    );
  }

  static Future<bool> showNoInternetDialog({
    required BuildContext context,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TwoOptionDialogWithIcon(
          title: LocaleKeys.one_option_dialog_title.tr(),
          text: LocaleKeys.server_internet_exception.tr(),
          icon: Icons.cloud_off,
          disableButtonText: LocaleKeys.one_option_dialog_button_text.tr(),
          confirmButtonText: LocaleKeys.server_try_again.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }

  static Future<bool> showServerErrorDialog({
    required BuildContext context,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TwoOptionDialogWithIcon(
          title: LocaleKeys.one_option_dialog_title.tr(),
          text: LocaleKeys.server_internal_exception.tr(),
          icon: Icons.storage,
          disableButtonText: LocaleKeys.one_option_dialog_button_text.tr(),
          confirmButtonText: LocaleKeys.server_try_again.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }

  static Future<bool> deleteProductFromCartDialog({
    required BuildContext context,
    final VoidCallback? confirmButton,
    final VoidCallback? disableButton,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppTwoOptionDialog(
          content: LocaleKeys.cart_tab_delete_product_popUp_text.tr(),
          confirmButtonText:
              LocaleKeys.cart_tab_delete_product_popUp_yes_button.tr(),
          disableButtonText:
              LocaleKeys.cart_tab_delete_product_popUp_no_button.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }

  static Future<bool> continueToCheckoutDialog({
    required BuildContext context,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppTwoOptionDialog(
          content: LocaleKeys.toll_selection_continue_dialog_text.tr(),
          confirmButtonText:
              LocaleKeys.toll_selection_continue_dialog_confirm_button.tr(),
          disableButtonText:
              LocaleKeys.toll_selection_continue_dialog_cancel_button.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }

  static Future<String?> selectDateDialogFunction({
    required BuildContext context,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const SelectDateDialog();
      },
    );
    if (result != null) {
      final String res = result as String;
      return res;
    }
    return null;
  }

  static Future<List<CartModel>?> selectTollDialogFunction({
    required BuildContext context,
    required VignetteProduct vignetteProduct,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SelectTollDialog(
          vignetteProduct: vignetteProduct,
        );
      },
    );
    if (result != null) {
      final List<CartModel> res = result as List<CartModel>;
      return res;
    }
    return null;
  }

  static Future<bool> paymentErrorDialog({
    required BuildContext context,
    required String type,
  }) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TwoOptionDialogWithIcon(
          title: (type == "paypal")
              ? LocaleKeys.paypal_payment_pop_up_error_title.tr()
              : LocaleKeys.stripe_payment_pop_up_error_title.tr(),
          text: (type == "paypal")
              ? LocaleKeys.paypal_payment_pop_up_error_text.tr()
              : LocaleKeys.stripe_payment_pop_up_error_text.tr(),
          icon: (type == "paypal") ? Icons.paypal : Icons.credit_card_outlined,
          disableButtonText: (type == "paypal")
              ? LocaleKeys.paypal_payment_pop_up_error_cancel.tr()
              : LocaleKeys.stripe_payment_pop_up_error_cancel.tr(),
          confirmButtonText: (type == "paypal")
              ? LocaleKeys.paypal_payment_pop_up_error_try_again.tr()
              : LocaleKeys.stripe_payment_pop_up_error_try_again.tr(),
        );
      },
    );
    if (result != null) {
      final bool res = result as bool;
      return res;
    }
    return false;
  }
}
