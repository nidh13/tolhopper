import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/new_image_widget.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/text/body_text.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/text/date_text.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/text/new_text_header.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/separator/app_separator.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class NewsListCard extends StatelessWidget {
  final String imageUrl;
  final String createdBy;
  final String content;
  final String date;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? readMore;
  const NewsListCard({
    Key? key,
    required this.imageUrl,
    required this.createdBy,
    this.isFirst = false,
    this.isLast = false,
    required this.content,
    required this.readMore,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 15 : 5, top: isFirst ? 15 : 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: Row(
                    children: [
                      NewsImageWidget(imageUrl: imageUrl),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NewsTextHeader(
                                title: createdBy,
                              ),
                              NewsBodyText(text: content),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: NewsDateText(
                                        text: date,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 85,
                                      child: GlobalAppButton(
                                        text: LocaleKeys.news_read_more.tr(),
                                        style: theme.textTheme.headline2
                                            ?.copyWith(
                                                color: buttonDarkTextColor,
                                                fontSize: 12,
                                                height: 1.19),
                                        height: 32,
                                        onPressed: readMore,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const AppSeparatorWidget(),
        ],
      ),
    );
  }
}
