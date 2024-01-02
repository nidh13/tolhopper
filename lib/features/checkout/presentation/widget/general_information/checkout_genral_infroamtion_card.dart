import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/descriptif_text_bloc.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class CheckoutGeneralInformationCard extends StatelessWidget {
  final String fullName;
  final String licensePateNumber;
  final String date;
  final String time;
  final String address;
  //final String cardInformation;
  //final PaymentMethodEnum paymentMethodEnum;
  const CheckoutGeneralInformationCard({
    Key? key,
    required this.fullName,
    // required this.paymentMethodEnum,
    required this.licensePateNumber,
    required this.date,
    required this.time,
    //required this.cardInformation,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: geryCheckoutBorder, width: 1),
        borderRadius: BorderRadius.zero,
        color: globalBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DescriptionTextBlocWidget(
                  title: LocaleKeys.checkout_name_label.tr(),
                  text: fullName,
                  hasBigTitle: true,
                ),
                DescriptionTextBlocWidget(
                  title: LocaleKeys.checkout_license_pate_number.tr(),
                  text: licensePateNumber,
                  hasBigTitle: true,
                  toLeft: true,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DescriptionTextBlocWidget(
                  title: LocaleKeys.checkout_date_time.tr(),
                  text: date,
                ),
                DescriptionTextBlocWidget(
                  title: "",
                  text: time,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            DescriptionTextBlocWidget(
              title: LocaleKeys.contact_information_address_title.tr(),
              text: address,
            ),
            const SizedBox(
              height: 15,
            ),
            /* DescriptionTextWithIcon(
              icon: paymentMethodEnum.icon,
              isPngIcon: paymentMethodEnum.isPngIcon,
              title: LocaleKeys.payment_method_app_bar_title.tr(),
              cardInformation: cardInformation,
            ),

             */
          ],
        ),
      ),
    );
  }
}
