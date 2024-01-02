import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/icons/png_icon.dart';
import 'package:tollhopper/global/common_widgets/icons/simple_svg_icon.dart';
import 'package:tollhopper/global/theme/themes.dart';

class PaymentMethodListCardElementWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? borderColor;
  final bool isPngIcon;
  const PaymentMethodListCardElementWidget(
      {Key? key,
      required this.title,
      required this.borderColor,
      this.isPngIcon = false,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? geryPaymentMethodBorder,
            width: 0.7,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              isPngIcon
                  ? AppPngIcon(
                      path: icon,
                      height: 40,
                      width: 40,
                    )
                  : GlobalSvgIcon(
                      icon: icon,
                      height: 40,
                      width: 40,
                    ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: theme.textTheme.headline2
                    ?.copyWith(fontSize: 14, height: 1.57),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
