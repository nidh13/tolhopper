import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/luch_url_utils/luch_url_utils.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignettes_card_widget.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class ListVignette extends StatelessWidget {
  final List<VignetteModel> activeVignettes;
  final Function(CartModel) choseVignette;
  final Function(List<CartModel>) chosetolls;

  const ListVignette({
    Key? key,
    required this.activeVignettes,
    required this.choseVignette,
    required this.chosetolls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);

    return ListView.builder(
      itemCount: activeVignettes.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: (index == 0) ? 15 : 7.5,
            bottom: (index == activeVignettes.length - 1) ? 15 : 7.5,
          ),
          child: VignettesCardWidget(
            downloadButton: () async {
              await URLUtils.launchURL(
                "$globalApiDomain${activeVignettes[index].fileName}",
                LaunchMode.externalApplication,
              );
            },
            extendButton: null,
            firstValue: getInputField(
                activeVignettes[index].licencePilateRegex ?? '', 0),
            secondValue: getInputField(
                activeVignettes[index].licencePilateRegex ?? '', 1),
            thirdValue: getInputField(
                activeVignettes[index].licencePilateRegex ?? '', 2),
            countryCode: CountryCode.fromCountryCode(
                activeVignettes[index].licencePilateCountry ?? germanyCode),
            orderDate: convertDateWithDotsToAbbreviatedMonth(
              originalDate: activeVignettes[index].startDate,
              locale: locale,
            ),
            validityDate: convertDateWithDotsToAbbreviatedMonth(
              originalDate: activeVignettes[index].endDate,
              locale: locale,
            ),
            title: activeVignettes[index].title ?? '',
          ),
        );
      },
    );
  }

  onExtendClicked(String type) {
    if (type.isNotEmpty) {
      if (type == 'vignette') {
        // choseVignette();
      }
      if (type == 'toll') {
        //chosetolls();
      }
    }
  }
}
