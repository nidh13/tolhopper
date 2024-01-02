import 'dart:io' as io;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/common_widgets/inputs/common_text_form_filed/common_text_form_filed_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/const.dart';

class CommonDatePicker extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validateData;
  const CommonDatePicker(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.validateData})
      : super(key: key);

  @override
  State<CommonDatePicker> createState() => _CommonDatePickerState();
}

class _CommonDatePickerState extends State<CommonDatePicker> {
  String dateSelected = DateFormat(dateFormat).format(DateTime.now());
  final minimumDate = DateTime.now();
  final initialDateTime = DateTime.now();
  void _showDatePicker({required ThemeData theme}) async {
    if (io.Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: 370,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CupertinoTheme(
                      data: const CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                              color: buttonDarkTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        dateOrder: DatePickerDateOrder.dmy,
                        initialDateTime: initialDateTime,
                        minimumDate: minimumDate,
                        maximumDate: DateTime(datePickerEndYearDate),
                        onDateTimeChanged: (pickedDate) {
                          String formattedDate =
                              DateFormat(dateFormat).format(pickedDate);
                          setState(
                            () {
                              dateSelected = formattedDate;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: geryHintLoginInputColor,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Center(
                            child: Text(
                              LocaleKeys.cancel.tr(),
                              style: theme.textTheme.headline4?.copyWith(
                                  fontSize: 13, color: buttonDarkTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(appPrimaryColor),
                        ),
                        onPressed: () {
                          widget.controller.text = dateSelected;
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          LocaleKeys.choose.tr(),
                          style: theme.textTheme.headline4?.copyWith(
                              fontSize: 13, color: globalBackgroundColor),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        locale: context.locale,
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime.now(),
        lastDate: DateTime(datePickerEndYearDate),
        builder: (context, child) {
          return Theme(
            data: theme.copyWith(
              colorScheme: const ColorScheme.light(
                primary: appPrimaryColor,
                onPrimary: geryTextLoginInputColor,
                onSurface: geryTextLoginInputColor, // body text color
              ),
              backgroundColor: globalBackgroundColor,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    primary: buttonDarkTextColor, // button text color
                    textStyle: theme.textTheme.headline3
                        ?.copyWith(color: buttonDarkTextColor)),
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickedDate != null) {
        String formattedDate = DateFormat(dateFormat).format(pickedDate);
        setState(
          () {
            widget.controller.text = formattedDate;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CommonTextForm(
      controller: widget.controller,
      hint: widget.hint,
      prefixIcon: calendarIconOutline,
      prefixIconColor: homeGerySubTitleColor,
      prefixIconHeight: 18,
      prefixIconWidth: 15,
      validateData: widget.validateData,
      onTap: () => _showDatePicker(
        theme: theme,
      ),
      readOnly: true,
    );
  }
}
