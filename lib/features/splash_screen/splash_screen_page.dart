import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/features/splash_screen/presentation/splash_screen_ui.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String? path;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);

    return BlocProvider(
      create: (BuildContext context) =>
          sl<SignInBloc>()..add(GetSplashScreenTestParamsEvent()),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (BuildContext context, state) {
          if (state is SplashScreenParamsLoadedState) {
            path = state.params.getPathToGo();
          }
        },
        child: SplashScreenUi(
          controller: _controller,
          whenComplete: () => goToHome(context, path ?? homePage),
        ),
      ),
    );
  }

  void goToHome(BuildContext context, String path) {
    Navigator.pushNamedAndRemoveUntil(
        context, path, (Route<dynamic> route) => false);
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _controller.dispose();
  }
}
