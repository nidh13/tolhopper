import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/texts/coming_soon_text.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class RoutePlanTabUi extends StatelessWidget {
  final TextEditingController locationController;
  const RoutePlanTabUi({
    Key? key,
    required this.locationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.route_plan_app_bar_title.tr(),
        ),
        body: const ComingSoonText(),
        // body: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        //     child: Column(
        //       children: [
        //         CommonTextFormBloc(
        //           controller: locationController,
        //           hint: LocaleKeys.route_plan_input_hint.tr(),
        //           title: LocaleKeys.route_plan_app_bar_title.tr(),
        //           prefixIcon: positionIcon,
        //           prefixIconColor: homeGerySubTitleColor,
        //           prefixIconHeight: 18,
        //           prefixIconWidth: 15,
        //         ),
        //         GlobalAppButton(
        //           text: LocaleKeys.route_plan_search.tr(),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
