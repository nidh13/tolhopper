import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';

class ExpansionOtherCountriesCardHeader extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool isExpanded;
  final DefinedCountry country;
  const ExpansionOtherCountriesCardHeader({
    Key? key,
    required this.onTap,
    required this.isExpanded,
    required this.country,
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
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Flag.fromString(country.alpha2, height: 25, width: 25),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                country.getNameWithLanguageCode(context),
                style: theme.textTheme.headline3,
              )),
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
