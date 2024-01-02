import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/texts/headline4_text_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';

class LoginCheckBox extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;
  final Color? textColor;
  final bool validate;
  final GestureTapCallback? onTapCheckboxText;
  final bool underLineText;
  const LoginCheckBox(
      {Key? key,
      required this.title,
      required this.isChecked,
      this.textColor,
      this.validate = true,
      this.onTapCheckboxText,
      this.underLineText = false,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: SizedBox(
            height: 17,
            width: 17,
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: validate
                    ? geryInputLoginBorderColor
                    : redErrorLoginInputColor,
              ),
              child: Checkbox(
                  value: isChecked,
                  onChanged: onChanged,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: appPrimaryColor,
                  focusColor: appPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        3.0), // Adjust the radius value as per your preference
                  ),
                  checkColor: geryTextLoginInputColor),
            ),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: InkWell(
            onTap: onTapCheckboxText,
            child: Headline4TextWidget(
              title: title,
              textColor: validate ? textColor : redErrorLoginInputColor,
              underLineText: underLineText,
            ),
          ),
        ),
      ],
    );
  }
}
