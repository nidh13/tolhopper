import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/features/cart_tab/data/models/cart_model.dart';
import 'package:tollhopper/features/my_vignettes/data/models/vignette_model.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/list_activ_vignettes.dart';
import 'package:tollhopper/features/my_vignettes/presentation/widget/list_expired_vignettes.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_switch_bottons.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class MyVignettesUi extends StatelessWidget {
  final VoidCallback? firstButtonTap;
  final VoidCallback? secondButtonTap;
  final int indexViewSelected;
  final GestureTapCallback? backButton;
  final Function(CartModel) choseVignette;
  final Function(List<CartModel>) chosetolls;
  final List<VignetteModel> activeVignettes;
  final List<VignetteModel> expiredVignettes;

  const MyVignettesUi({
    Key? key,
    required this.backButton,
    required this.indexViewSelected,
    required this.firstButtonTap,
    required this.secondButtonTap,
    required this.activeVignettes,
    required this.expiredVignettes,
    required this.choseVignette,
    required this.chosetolls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: (activeVignettes.isEmpty && expiredVignettes.isEmpty)
          ? Center(
              child: Text(
                LocaleKeys.vignettes_vignette_no_history.tr(),
                style: context.theme.textTheme.headline3,
              ),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                GlobalAppSwitchButton(
                  firstButtonTap: firstButtonTap,
                  indexSelected: indexViewSelected,
                  firstButtonTitle: LocaleKeys.vignettes_active.tr(),
                  secondButtonTap: secondButtonTap,
                  secondButtonTitle: LocaleKeys.vignettes_expired.tr(),
                ),
                Expanded(
                  child: IndexedStack(
                    index: indexViewSelected,
                    children: [
                      ListVignette(
                        activeVignettes: activeVignettes,
                        chosetolls: chosetolls,
                        choseVignette: choseVignette,
                      ),
                      ListExpiredVignettes(
                        expiredVignettes: expiredVignettes,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
