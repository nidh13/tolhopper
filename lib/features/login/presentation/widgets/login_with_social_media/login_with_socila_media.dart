import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_with_social_media/social_media_icon.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class LoginWithSocialMediaWidget extends StatelessWidget {
  final GestureTapCallback? onTapGoogle;
  final GestureTapCallback? onTapFacebook;
  final double? paddingTop;
  const LoginWithSocialMediaWidget(
      {Key? key, this.onTapGoogle, this.onTapFacebook, this.paddingTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 40),
      child: Column(
        children: [
          Text(
            LocaleKeys.login_or_sign_in_with.tr(),
            style: theme.textTheme.headline5?.copyWith(
                color: geryHintLoginInputColor,
                fontWeight: FontWeight.w300,
                height: 1.2),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Wrap(
              spacing: 20.0, // Set the spacing between elements
              alignment: WrapAlignment.center,
              children: const [
                SocialMediaIcon(icon: facebookIcon),
                SocialMediaIcon(icon: googleIcon),
              ],
            ),
          )
        ],
      ),
    );
  }
}
