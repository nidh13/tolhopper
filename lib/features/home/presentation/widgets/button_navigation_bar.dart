import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tollhopper/features/home/presentation/widgets/radio_enums/navigation_item.dart';
import 'package:tollhopper/global/theme/themes.dart';

class AppButtonNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final String productsNumber;
  const AppButtonNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
    required this.productsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: bottomNavigationBarBorderColor,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blueTextColor,
        unselectedItemColor: bottomNavigationBarTitleColor,
        selectedLabelStyle: barNavigationTitleTextStyle,
        unselectedLabelStyle: barNavigationTitleTextStyle,
        backgroundColor: globalBackgroundColor,
        onTap: onTap,
        items: NavigationItemEnum.values.map((item) {
          if (item.index == NavigationItemEnum.cart.index) {
            return BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          currentIndex == item.index
                              ? item.selectedIcon
                              : item.icon,
                          color: currentIndex == item.index
                              ? blueTextColor
                              : bottomNavigationBarTitleColor,
                          height: productsNumber == "0" ? 24 : 23,
                          width: productsNumber == "0" ? 24 : 23,
                        ),
                      ),
                    ),
                    productsNumber == "0"
                        ? const SizedBox()
                        : Positioned(
                            left: productsNumber.length > 1 ? 10.5 : 12.5,
                            bottom: productsNumber.length > 1 ? 9 : 9.5,
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
                                productsNumber,
                                style: theme.textTheme.headline4?.copyWith(
                                    fontSize: 9, color: globalBackgroundColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              label: item.title,
            );
          }
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == item.index ? item.selectedIcon : item.icon,
              color: currentIndex == item.index
                  ? blueTextColor
                  : bottomNavigationBarTitleColor,
              height: 24,
              width: 24,
            ),
            label: item.title,
          );
        }).toList(),
      ),
    );
  }
}
