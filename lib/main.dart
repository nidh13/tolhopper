import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/bloc_observer.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/codegen_loader.g.dart';
import 'package:tollhopper/global/translation/supported_language.dart';
import 'package:tollhopper/global/utils/const.dart';

import 'core/services/app_routes.dart' as route;
import 'core/services/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await di.init();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      path: translationPath,
      supportedLocales: [
        Locale(describeEnum(SupportedLanguageEasyLocalization.en)),
        Locale(describeEnum(SupportedLanguageEasyLocalization.de)),
      ],
      fallbackLocale:
          Locale(describeEnum(SupportedLanguageEasyLocalization.en)),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: [
        ...context.localizationDelegates,
        CountryLocalizations.delegate, // Add CountryLocalizations.delegate
      ],
      locale: context.locale,
      onGenerateRoute: route.controller,
      initialRoute: route.splashScreen,
      theme: appGlobalTheme,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
