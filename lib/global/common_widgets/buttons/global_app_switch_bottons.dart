import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/theme/themes.dart';

class GlobalAppSwitchButton extends StatelessWidget {
  final String firstButtonTitle;
  final String secondButtonTitle;
  final VoidCallback? firstButtonTap;
  final VoidCallback? secondButtonTap;
  final int indexSelected;
  const GlobalAppSwitchButton(
      {Key? key,
      required this.firstButtonTitle,
      required this.secondButtonTap,
      required this.firstButtonTap,
      required this.indexSelected,
      required this.secondButtonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GlobalAppButton(
            text: firstButtonTitle,
            onPressed: firstButtonTap,
            backGroundColor:
                (indexSelected == 0) ? null : appSwitchButtonsSecondButtonColor,
            textColor: (indexSelected == 0) ? null : homeGerySubTitleColor,
          ),
        ),
        Expanded(
          child: GlobalAppButton(
            text: secondButtonTitle,
            onPressed: secondButtonTap,
            backGroundColor:
                (indexSelected == 1) ? null : appSwitchButtonsSecondButtonColor,
            textColor: (indexSelected == 1) ? null : homeGerySubTitleColor,
          ),
        ),
      ],
    );
  }
}
