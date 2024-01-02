import 'package:flutter/material.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/checkout/presentation/widget/order_summary/order_summary_package_list_card.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:tollhopper/global/utils/functions.dart';

class OrderSummaryPackageList extends StatelessWidget {
  final List<CartModel> cart;
  const OrderSummaryPackageList({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);
    return ListView.separated(
      itemCount: cart.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: OrderSummaryPackageListCard(
            packageName: cart[index].getPackageNameWithLanguageCode(context),
            title: cart[index].getTitleWithLanguageCode(context),
            additionalFee: "",
            subTotal: getTextWithAppCurrency(cart[index].displayPrice()),
            startDate: formatStringDate(
              dateString: cart[index].dateStart ?? '',
              pattern: checkoutDateFormat,
              locale: locale,
            ),
            endDate: getEndDate(
              cart[index].dateStart ?? '',
              cart[index].duration ?? '',
              locale,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 5,
          color: Colors.grey,
        );
      },
    );
  }

  String getEndDate(String startDate, String? duration, String locale) {
    if (duration != null && duration.isNotEmpty) {
      return formatDateTimeToString(
        dateTime: addDuration(startDate, duration),
        pattern: checkoutDateFormat,
        locale: locale,
      );
    } else {
      return formatDateTimeToString(
        dateTime: addDuration(startDate, "1y"),
        pattern: checkoutDateFormat,
        locale: locale,
      );
    }
  }
}
