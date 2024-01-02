import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/features/imprint/presentation/widgets/imprint_info.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';

class ImprintUi extends StatelessWidget {
  final void Function()? onTap;

  const ImprintUi({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalBackgroundColor,
      appBar: CommonAppBar(
        title: LocaleKeys.drawer_imprint.tr(),
        hasBackButton: true,
        onTap: onTap,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: context.theme.textTheme.headline2
                  ?.copyWith(color: labelBlackColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImprintInfo(
                    icon: CupertinoIcons.location,
                    content: companyAddress,
                  ),
                  const SizedBox(height: 15),
                  ImprintInfo(
                    icon: CupertinoIcons.mail,
                    content: companyEmail,
                    onTap: launchEmail,
                    textStyle: context.theme.textTheme.headline3?.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const ImprintInfo(
                    icon: CupertinoIcons.link,
                    content: companyWebPage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchEmail() {
    const mailUrl = 'mailto:$companyEmail';
    launchUrl(
      Uri.parse(mailUrl),
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
