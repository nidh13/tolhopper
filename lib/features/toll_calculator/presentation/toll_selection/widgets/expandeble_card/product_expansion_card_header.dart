import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class ProductExpansionCardHeader extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isExpanded;
  final FlagsCode flagCode;
  final String countryName;
  const ProductExpansionCardHeader({
    Key? key,
    required this.onTap,
    required this.isExpanded,
    required this.flagCode,
    required this.countryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          border: Border(
              right: const BorderSide(
                color: trajectoryCardBorderColor, // Color of the right border
                width: 1.0, // Width of the right border
              ),
              left: const BorderSide(
                color: trajectoryCardBorderColor, // Color of the left border
                width: 1.0, // Width of the left border
              ),
              bottom: BorderSide(
                color: isExpanded
                    ? Colors.transparent
                    : trajectoryCardBorderColor, // Color of the bottom border
                width: 1.0, // Width of the bottom border
              ),
              top: const BorderSide(
                color: trajectoryCardBorderColor, // Color of the bottom border
                width: 1.0, // Width of the bottom border
              )),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Flag.fromCode(flagCode, height: 25, width: 25),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  countryName,
                  style: theme.textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: labelBlackColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
