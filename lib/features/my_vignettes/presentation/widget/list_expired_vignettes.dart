import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/luch_url_utils/luch_url_utils.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/vignettes_card_widget.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/country_app.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class ListExpiredVignettes extends StatelessWidget {
  final List<VignetteModel> expiredVignettes;

  const ListExpiredVignettes({
    Key? key,
    required this.expiredVignettes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);

    return ListView.builder(
        itemCount: expiredVignettes.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: (index == 0) ? 15 : 7.5,
              bottom: (index == expiredVignettes.length - 1) ? 15 : 7.5,
            ),
            child: VignettesCardWidget(
              downloadButton: () async {
                await URLUtils.launchURL(
                  "$globalApiDomain${expiredVignettes[index].fileName}",
                  LaunchMode.externalApplication,
                );
              },
              extendButton: null,
              firstValue: getInputField(
                  expiredVignettes[index].licencePilateRegex ?? '', 0),
              secondValue: getInputField(
                  expiredVignettes[index].licencePilateRegex ?? '', 1),
              thirdValue: getInputField(
                  expiredVignettes[index].licencePilateRegex ?? '', 2),
              isExpired: true,
              countryCode: CountryCode.fromCountryCode(
                  expiredVignettes[index].licencePilateCountry ?? germanyCode),
              orderDate: convertDateWithDotsToAbbreviatedMonth(
                originalDate: expiredVignettes[index].startDate,
                locale: locale,
              ),
              validityDate: convertDateWithDotsToAbbreviatedMonth(
                originalDate: expiredVignettes[index].endDate,
                locale: locale,
              ),
              title: expiredVignettes[index].title ?? '',
            ),
          );
        });
  }
}
