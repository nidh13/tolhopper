import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class CountrySelectWidget extends StatelessWidget {
  final CountryCode? country;
  final ValueChanged<CountryCode>? onChanged;
  final bool hasBorder;
  final List<String>? countriesDisplay;
  final List<String>? favoritesCountries;
  final bool hideSearch;
  final bool hasSize;
  final double? sizeHeight;
  final double? sizeWidth;
  const CountrySelectWidget({
    Key? key,
    required this.country,
    required this.onChanged,
    this.countriesDisplay,
    this.hasSize = false,
    this.sizeHeight,
    this.sizeWidth,
    this.favoritesCountries,
    this.hideSearch = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 49,
      decoration: BoxDecoration(
        border: Border.all(
          color: hasBorder
              ? trajectoryCardBorderColor
              : Colors.transparent, // Set the desired border color
          width: 1.0,
        ),
        color: globalBackgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: CountryCodePicker(
              onChanged: onChanged,
              initialSelection: country?.code ?? "DE",
              padding: const EdgeInsets.symmetric(horizontal: 0),
              showCountryOnly: true,
              dialogSize: hasSize && (sizeHeight != null && sizeWidth != null)
                  ? Size(sizeHeight!, sizeWidth!)
                  : null,
              showOnlyCountryWhenClosed: true,
              alignLeft: true,
              textStyle: theme.textTheme.headline3,
              dialogTextStyle: theme.textTheme.headline3,
              countryFilter: countriesDisplay,
              hideSearch: hideSearch,
              favorite: favoritesCountries ?? [],
              flagWidth: 30,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_drop_down,
              color: labelBlackColor,
            ),
          )
        ],
      ),
    );
  }
}
