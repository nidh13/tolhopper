import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/payment_method/presentation/widget/payment_methode_list.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class PaymentMethodeUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final void Function(int) selectPaymentMethod;
  final VoidCallback? proceedToCheckout;
  final int indexSelected;
  final bool isLoading;
  const PaymentMethodeUi({
    Key? key,
    required this.backButton,
    required this.indexSelected,
    required this.selectPaymentMethod,
    required this.proceedToCheckout,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.payment_method_app_bar_title.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Column(
            children: [
              Expanded(
                child: PaymentMethodList(
                  indexSelected: indexSelected,
                  selectPaymentMethod: selectPaymentMethod,
                ),
              ),
              isLoading
                  ? const LoadingScreen()
                  : GlobalAppButton(
                      text: LocaleKeys.payment_method_pay_now.tr(),
                      onPressed: proceedToCheckout,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
