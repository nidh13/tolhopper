import 'package:flutter/material.dart';
import 'package:tollhopper/features/payment_method/presentation/widget/enum/payment_method_enum.dart';
import 'package:tollhopper/features/payment_method/presentation/widget/payment_methode_list_card.dart';

class PaymentMethodList extends StatelessWidget {
  final void Function(int) selectPaymentMethod;
  final int indexSelected;
  const PaymentMethodList(
      {Key? key,
      required this.selectPaymentMethod,
      required this.indexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: paymentMethodList.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PaymentMethodListCard(
            icon: paymentMethodList[index].icon,
            title: paymentMethodList[index].title,
            isPngIcon: paymentMethodList[index].isPngIcon,
            isFirst: index == 0,
            isSelected: (index == indexSelected),
            onTap: () {
              selectPaymentMethod(index);
            },
          );
        });
  }
}
