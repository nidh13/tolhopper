import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/registre/presentation/radio_enum/user_gender.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class GenderSelectOption extends StatefulWidget {
  final UserGender? gender;
  final Function changeGender;
  final bool hasBackground;
  final FormFieldValidator<UserGender>? validateData;
  const GenderSelectOption(
      {Key? key,
      required this.changeGender,
      required this.gender,
      this.validateData,
      required this.hasBackground})
      : super(key: key);

  @override
  State<GenderSelectOption> createState() => _GenderSelectOptionState();
}

class _GenderSelectOptionState extends State<GenderSelectOption> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonFormField(
      value: widget.gender,
      isExpanded: true,
      validator: widget.validateData,
      onChanged: (UserGender? newValue) {
        if (newValue != null) {
          widget.changeGender(
            newValue,
          );
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        size: 25,
        color: (widget.gender != null)
            ? geryTextLoginInputColor
            : geryHintLoginInputColor,
      ),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: LocaleKeys.register_gender_hint.tr(),
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
      items: UserGender.values
          .map<DropdownMenuItem<UserGender>>((UserGender values) {
        return DropdownMenuItem<UserGender>(
          value: values,
          child: Text(
            values.title,
            style: theme.textTheme.headline5,
          ),
        );
      }).toList(),
    );
  }
}
