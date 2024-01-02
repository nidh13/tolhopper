import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/home_tab/data/models/vignette_product_model.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expandeble_card/product_expansion_card_body.dart';
import 'package:tollhopper/features/toll_calculator/presentation/toll_selection/widgets/expandeble_card/product_expansion_card_header.dart';

class ProductExpansionCard extends StatefulWidget {
  final List<VignetteProduct> listVignette;
  final List<VignetteProduct> listTolls;
  final bool hasVignette;
  final bool hasTolls;
  final String countryName;
  final FlagsCode flagCode;
  final bool isExpanded;
  const ProductExpansionCard({
    Key? key,
    required this.listTolls,
    required this.hasTolls,
    required this.hasVignette,
    required this.countryName,
    required this.listVignette,
    required this.flagCode,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ProductExpansionCard> createState() => _ProductExpansionCardState();
}

class _ProductExpansionCardState extends State<ProductExpansionCard> {
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
          ProductExpansionCardHeader(
            onTap: openCloseCard,
            countryName: widget.countryName,
            flagCode: widget.flagCode,
            isExpanded: isExpanded,
          ),
          isExpanded
              ? ProductExpansionCardBody(
                  listVignette: widget.listVignette,
                  hasVignette: widget.hasVignette,
                  hasTolls: widget.hasTolls,
                  listTolls: widget.listTolls,
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
