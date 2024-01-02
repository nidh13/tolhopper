import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/faq/widgets/faq_expansion_card.dart';
import 'package:tollhopper/features/faq/widgets/rich_text_content.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class FAQUi extends StatelessWidget {
  final void Function() onTap;
  final TextStyle? defaultTextSpanStyle;

  const FAQUi({
    Key? key,
    this.defaultTextSpanStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: globalBackgroundColor,
      appBar: CommonAppBar(
        title: LocaleKeys.drawer_faq.tr(),
        hasBackButton: true,
        onTap: onTap,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FAQExpansionCard(
                question: LocaleKeys.faq_question1.tr(),
                description: LocaleKeys.faq_body_question1_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question2.tr(),
                description: LocaleKeys.faq_body_question2_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_sub_description.tr(),
                    style: theme.textTheme.headline4,
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle4_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle4_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle5_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle5_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle6_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle6_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question2_subtitle7_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question2_subtitle7_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question3.tr(),
                description: LocaleKeys.faq_body_question3_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question4.tr(),
                description: LocaleKeys.faq_body_question4_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question4_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question4_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question4_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question4_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question4_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question4_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question4_subtitle4_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question4_subtitle4_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question4_subtitle5_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question4_subtitle5_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question5.tr(),
                description: LocaleKeys.faq_body_question5_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question6.tr(),
                description: LocaleKeys.faq_body_question6_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question7.tr(),
                description: LocaleKeys.faq_body_question7_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question8.tr(),
                description: LocaleKeys.faq_body_question8_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question9.tr(),
                description: LocaleKeys.faq_body_question9_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question9_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question9_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question9_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question9_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question9_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question9_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question10.tr(),
                description: LocaleKeys.faq_body_question10_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question11.tr(),
                description: LocaleKeys.faq_body_question11_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question12.tr(),
                description: LocaleKeys.faq_body_question12_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question13.tr(),
                description: LocaleKeys.faq_body_question13_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question14.tr(),
                description: LocaleKeys.faq_body_question14_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle4_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle4_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle5_title.tr(),
                    children: <InlineSpan>[
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle5_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle6_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle6_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle7_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle7_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question14_subtitle8_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question14_subtitle8_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question15.tr(),
                description: LocaleKeys.faq_body_question15_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question15_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question15_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question15_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question15_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question15_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question15_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question15_subtitle4_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question15_subtitle4_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question16.tr(),
                description: LocaleKeys.faq_body_question16_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question16_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question16_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question16_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question16_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question16_subtitle3_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question16_subtitle3_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question17.tr(),
                description: LocaleKeys.faq_body_question17_description.tr(),
                body: [
                  RichTextContent(
                    title: LocaleKeys.faq_body_question17_subtitle1_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question17_subtitle1_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichTextContent(
                    title: LocaleKeys.faq_body_question17_subtitle2_title.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys
                            .faq_body_question17_subtitle2_description
                            .tr(),
                        style: defaultTextSpanStyle,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question18.tr(),
                description: LocaleKeys.faq_body_question18_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question19.tr(),
                description: LocaleKeys.faq_body_question19_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question20.tr(),
                description: LocaleKeys.faq_body_question20_description.tr(),
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question21.tr(),
                description: LocaleKeys.faq_body_question21_description.tr(),
                body: [
                  RichText(
                    text: TextSpan(
                      text: LocaleKeys.faq_body_question21_subtitle1_title.tr(),
                      style: theme.textTheme.headline3,
                      children: <InlineSpan>[
                        TextSpan(
                          text: LocaleKeys
                              .faq_body_question21_subtitle1_description
                              .tr(),
                          style: defaultTextSpanStyle,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: LocaleKeys.faq_body_question21_subtitle2_title.tr(),
                      style: theme.textTheme.headline3,
                      children: <InlineSpan>[
                        TextSpan(
                          text: LocaleKeys
                              .faq_body_question21_subtitle2_description
                              .tr(),
                          style: defaultTextSpanStyle,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: LocaleKeys.faq_body_question21_sub_description.tr(),
                      style: theme.textTheme.headline4,
                    ),
                  ),
                ],
              ),
              FAQExpansionCard(
                question: LocaleKeys.faq_question22.tr(),
                description: LocaleKeys.faq_body_question22_description.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
