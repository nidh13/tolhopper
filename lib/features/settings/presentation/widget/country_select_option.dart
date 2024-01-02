import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/translation/supported_language.dart';

class LanguageSelectOption extends StatefulWidget {
  final SupportedLanguageEasyLocalization? language;
  final Function changeLanguage;
  final bool hasBackground;
  const LanguageSelectOption(
      {Key? key,
      required this.changeLanguage,
      required this.language,
      required this.hasBackground})
      : super(key: key);

  @override
  State<LanguageSelectOption> createState() => _LanguageSelectOptionState();
}

class _LanguageSelectOptionState extends State<LanguageSelectOption> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonFormField(
      value: widget.language,
      isExpanded: true,
      onChanged: (SupportedLanguageEasyLocalization? newValue) {
        if (newValue != null) {
          widget.changeLanguage(
            newValue,
          );
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        size: 25,
        color: (widget.language != null)
            ? geryTextLoginInputColor
            : geryHintLoginInputColor,
      ),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: LocaleKeys.settings_change_language_title.tr(),
        hintStyle:
            theme.textTheme.headline5?.copyWith(color: geryHintLoginInputColor),
        fillColor: widget.hasBackground
            ? globalBackgroundColor
            : geryInputLoginBackGroundColor, // Set the desired background color
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.hasBackground
                ? globalTextFormFiledBorderColor
                : geryInputLoginBorderColor, // Set the desired border color
            width: 1.0, // Set the desired border width
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: widget.hasBackground
                  ? globalTextFormFiledBorderColor
                  : geryInputLoginBorderColor,
              width: 1), // Border color and width
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: appPrimaryColor, width: 1), // Focus border color and width
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
              color: redErrorLoginInputColor,
              width: 1), // Error border color and width
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        // we add this to fix height of input when it validate
        helperText: " ",
        helperStyle: theme.textTheme.headline5
            ?.copyWith(color: Colors.transparent, height: 0.5),
        errorStyle: theme.textTheme.headline5
            ?.copyWith(color: redErrorLoginInputColor, height: 0.5),
      ),
      items: SupportedLanguageEasyLocalization.values
          .map<DropdownMenuItem<SupportedLanguageEasyLocalization>>(
              (SupportedLanguageEasyLocalization values) {
        return DropdownMenuItem<SupportedLanguageEasyLocalization>(
          value: values,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Flag.fromCode(values.flag, height: 25, width: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                values.title,
                style: theme.textTheme.headline5,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
