import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/order_summary/presentation/widget/congratulation_text.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class AppCongratulationWidget extends StatelessWidget {
  const AppCongratulationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalSvgIcon(icon: congratulationsIcon),
        const SizedBox(
          height: 10,
        ),
        CongratulationText(
          title: LocaleKeys.order_summary_congratulation.tr(),
          subTitle: LocaleKeys.order_summary_success_message.tr(),
        ),
      ],
    );
  }
}
