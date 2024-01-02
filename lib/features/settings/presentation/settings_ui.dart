import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/text_form/login_text_form_title.dart';
import 'package:tollhopper/features/settings/presentation/widget/country_select_option.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/translation/supported_language.dart';

class SettingUi extends StatelessWidget {
  final GestureTapCallback? backButton;
  final SupportedLanguageEasyLocalization? language;
  final Function changeLanguage;
  const SettingUi(
      {Key? key,
      required this.backButton,
      required this.changeLanguage,
      required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalBackgroundColor,
        appBar: CommonAppBar(
          title: LocaleKeys.drawer_settings.tr(),
          hasBackButton: true,
          onTap: backButton,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginTextFormTitle(
                    title: LocaleKeys.settings_change_language_title.tr()),
                LanguageSelectOption(
                  changeLanguage: changeLanguage,
                  hasBackground: true,
                  language: language,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
