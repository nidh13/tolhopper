import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tollhopper/global/assets/icons.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/const.dart';

class HomeAppBarCartWidget extends StatelessWidget {
  final String price;
  final String productNumber;
  final GestureTapCallback? onTapCart;
  const HomeAppBarCartWidget({
    Key? key,
    required this.price,
    required this.productNumber,
    required this.onTapCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTapCart,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: cartBorder,
              width: 0.88,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Center(
                          child: SvgPicture.asset(
                            cartIcon,
                            color: labelBlackColor,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      productNumber == "0"
                          ? const SizedBox()
                          : Positioned(
                              right: 0,
                              bottom: 10,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: redErrorLoginInputColor,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                                child: Text(
                                  productNumber,
                                  style: theme.textTheme.headline4?.copyWith(
                                      fontSize: 9,
                                      color: globalBackgroundColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  price + " $appCurrency",
                  style: theme.textTheme.headline3?.copyWith(
                      color: labelBlackColor, fontSize: 13.13, height: 1.22),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
