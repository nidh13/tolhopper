import 'package:flutter/material.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expansion_other_countries/expansion_other_countries_body.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expansion_other_countries/expansion_other_countries_header.dart';
import 'package:tollhopper/global/utils/countries_names_utils.dart';

class ProductOtherCountriesExpansionCard extends StatefulWidget {
  final DefinedCountry country;
  final bool isExpanded;
  const ProductOtherCountriesExpansionCard({
    Key? key,
    required this.country,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ProductOtherCountriesExpansionCard> createState() =>
      _ProductOtherCountriesExpansionCardState();
}

class _ProductOtherCountriesExpansionCardState
    extends State<ProductOtherCountriesExpansionCard> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ExpansionOtherCountriesCardHeader(
            onTap: openCloseCard,
            country: widget.country,
            isExpanded: isExpanded,
          ),
          isExpanded
              ? ExpansionOtherCountriesCardBody(
                  country: widget.country,
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void openCloseCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
