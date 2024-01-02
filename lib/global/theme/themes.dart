import 'package:flutter/material.dart';

const appFont = "SFPro";
const interFont = "Inter";
const arimoFont = "Arimo";

const appPrimaryColor = Color(0xFF94D8FF);

///big title color
const titleBlackColor = Color(0xFF020202);
const descriptionGreyColor = Color(0xFF8A929B);
const labelBlackColor = Color(0xFF000000);

///login inputColors
const geryHintLoginInputColor = Color(0xFFA4AFAF);
const geryInputLoginBorderColor = Color(0xFFDDDDDD);
const geryInputLoginBackGroundColor = Color(0xFFF4F8FA);
const geryInputLoginInnerShadowColor = Color(0xFFE2E7EB);
const geryTextLoginInputColor = Color(0xFF111827);
const redErrorLoginInputColor = Color(0xFFEB5757);

const buttonDarkTextColor = Color(0xFF1F2937);
const checkBoxTextColor = Color(0xFF9CA3AF);
const blueTextColor = Color(0xFF66C7FF);

const blackAppBarTextColor = Color(0xFF212225);

const globalBackgroundColor = Color(0xFFFFFFFF);

const bottomNavigationBarBorderColor = Color(0xFFEEECEC);

const bottomNavigationBarTitleColor = Color(0xFF718093);

const homeAppBarBorderColor = Color(0xFFE0E0E0);

const cartBorder = Color(0xFFE9E9E9);

const iconWithCircularBackgroundColor = Color(0xFFF3F4F6);

const homeGerySubTitleColor = Color(0xFF6B7280);

const globalTextFormFiledBorderColor = Color(0xFFE5E7EB);

const selectedIconColor = Color(0xFF374151);

const selectionGreen = Color(0xFF6FCF97);

const trajectoryTextColor = Color(0xFF4B5563);

const trajectoryCardBorderColor = Color(0xFFE1E1E1);

const bluePateNumberColor = Color(0xFF00309A);

const appSwitchButtonsSecondButtonColor = Color(0xFFF1F2F4);

const geryPateInputColor = Color(0xFFF9F9F9);

const geryPaymentMethodBorder = Color(0xFFE1E1E1);

const geryCheckoutBorder = Color(0xFFE5E7EB);

const backGroundCheckoutColor = Color(0xFFF6F7F8);

const descriptionTextColor = Color(0xFF596372);

const descriptionTextSmallTitleColor = Color(0xFF64748B);

const orderSummaryItemTitleColor = Color(0xFF222B45);

const orderSummaryItemTextColor = Color(0xFF0D0E0C);

const orderSummaryItemLabelColor = Color(0xFF222B45);

const orderSummaryTotalAmountColor = Color(0xFF1F2937);

const back1 = Color(0xFF333536);

const drawerBlackText = Color(0xFF002433);

const drawerGreyText = Color(0xFF9AA0A6);

const newsGreyText = Color(0xFF6B7287);

const newsBlocColor = Color(0xFF121212);

const separatorColor = Color(0xFFF3F3F3);

const polyLineColor = Color(0xFFD21D1D);

const freeToLLColor = Color(0xFFffa500);

const TextStyle trajectoryTextStyle = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: trajectoryTextColor,
    height: 1.26);
const TextStyle skipTextStyle = TextStyle(
  fontFamily: interFont,
  fontWeight: FontWeight.w500,
  fontSize: 13,
  color: blueTextColor,
);
const TextStyle barNavigationTitleTextStyle = TextStyle(
  fontFamily: arimoFont,
  fontWeight: FontWeight.w400,
  height: 1.73,
  fontSize: 11,
  color: bottomNavigationBarTitleColor,
);

const TextStyle commonLabelStyle = TextStyle(
    fontFamily: appFont,
    color: buttonDarkTextColor,
    fontSize: 14,
    height: 1.35,
    fontWeight: FontWeight.w400);

const TextStyle cartTitleStyle = TextStyle(
    fontFamily: appFont,
    color: labelBlackColor,
    fontSize: 15,
    height: 1.21,
    fontWeight: FontWeight.w500);

final ThemeData appGlobalTheme = ThemeData(
  primaryColor: appPrimaryColor,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 20.0,
      color: titleBlackColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w700,
      height:
          1.58, // Calculated by dividing line height (37.16) by font size (20)
    ),
    headline2: TextStyle(
        fontFamily: appFont,
        color: blackAppBarTextColor,
        fontSize: 18,
        height: 1.057,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        fontFamily: appFont,
        color: labelBlackColor,
        fontSize: 14,
        height: 1.28,
        fontWeight: FontWeight.w500),
    headline4: TextStyle(
      fontSize: 13.0,
      color: buttonDarkTextColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
      height: 1.4615, // calculated as 19px / 13px
      letterSpacing: 0.13, // calculated as 1% of 13px
    ),
    headline5: TextStyle(
      fontSize: 12.0,
      color: geryTextLoginInputColor,
      height: 1.583,
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
        fontSize: 14.0,
        color: descriptionGreyColor,
        height: 1.43,
        letterSpacing: 0.17,
        fontFamily: appFont,
        fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        fontSize: 11.0,
        color: homeGerySubTitleColor,
        fontFamily: appFont,
        height: 1.65,
        fontWeight: FontWeight.w400),
    bodyText1: TextStyle(
        fontSize: 13.71,
        color: descriptionTextColor,
        fontFamily: appFont,
        height: 1.19,
        fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
      fontSize: 12,
      height: 1.19,
      color: descriptionTextSmallTitleColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      height: 1.46,
      color: labelBlackColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
    ),
  ),
);
