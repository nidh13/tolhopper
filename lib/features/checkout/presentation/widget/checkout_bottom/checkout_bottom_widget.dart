import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class CheckoutBottomWidget extends StatelessWidget {
  final VoidCallback? checkoutFunction;
  final String totalAmount;
  const CheckoutBottomWidget({
    Key? key,
    required this.checkoutFunction,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: geryCheckoutBorder, width: 1)),
        color: globalBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  LocaleKeys.checkout_total_amount.tr(),
                  style: theme.textTheme.headline1?.copyWith(
                      color: orderSummaryTotalAmountColor,
                      fontSize: 15.73,
                      height: 0.92),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  totalAmount,
                  style: theme.textTheme.headline1?.copyWith(
                      color: blueTextColor, fontSize: 25.03, height: 1.22),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: GlobalAppButton(
                text: LocaleKeys.checkout_checkout.tr(),
                height: 50,
                onPressed: checkoutFunction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
