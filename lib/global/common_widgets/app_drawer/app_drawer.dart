import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/home/presentation/widgets/radio_enums/navigation_item.dart';
import 'package:tollhopper/features/login/presentation/authentification_bloc/sign_in_bloc.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/app_drawer_enum.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/element_card_drawer.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/log_out_widgt.dart';
import 'package:tollhopper/global/common_widgets/app_drawer/login_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/routes_paramaters.dart';

class AppDrawer extends StatefulWidget {
  final GestureTapCallback? logout;
  final GestureTapCallback? backToLogin;
  final void Function({
    required AppDrawerEnum appDrawerEnum,
    dynamic settings,
  }) navigateToPages;
  final ValueChanged<int> changePage;

  const AppDrawer({
    Key? key,
    required this.logout,
    required this.navigateToPages,
    this.backToLogin,
    required this.changePage,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isUserLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInBloc>()..add(GetLoginStateEvent()),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is IsLoginState) {
            setState(() {
              isUserLoggedIn = true;
            });
            BlocProvider.of<SignInBloc>(context).add(GetUserEvent());
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Drawer(
              backgroundColor: globalBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    /// if you add user images
                    // isUserLoggedIn
                    //     ? (state is SignInLoading)
                    //         ? const Padding(
                    //             padding: EdgeInsets.only(bottom: 20),
                    //             child: DrawerPersonalInformation(
                    //               fullName: "",
                    //               email: "",
                    //             ),
                    //           )
                    //         : state is UserLoadedState
                    //             ? Padding(
                    //                 padding: const EdgeInsets.only(bottom: 20),
                    //                 child: DrawerPersonalInformation(
                    //                   fullName: "${state.userModel.lastName}"
                    //                       "  ${state.userModel.firstName}",
                    //                   email: state.userModel.email ?? '',
                    //                 ),
                    //               )
                    //             : const SizedBox.shrink()
                    //     : const SizedBox.shrink(),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ElementCardDrawer(
                                title: AppDrawerEnum.account.labelName,
                                icon: AppDrawerEnum.account.icon,
                                onTap: () {
                                  widget.navigateToPages(
                                    appDrawerEnum: AppDrawerEnum.account,
                                    settings: AccountSettingsParams(
                                      isUserConnected: isUserLoggedIn,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ElementCardDrawer(
                                title: AppDrawerEnum.vignettes.labelName,
                                icon: AppDrawerEnum.vignettes.icon,
                                onTap: () => widget.changePage(
                                  NavigationItemEnum.vignette.index,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ElementCardDrawer(
                                title: AppDrawerEnum.news.labelName,
                                icon: AppDrawerEnum.news.icon,
                                onTap: () => widget.changePage(
                                  NavigationItemEnum.news.index,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ElementCardDrawer(
                                title: AppDrawerEnum.settings.labelName,
                                icon: AppDrawerEnum.settings.icon,
                                onTap: () {
                                  widget.navigateToPages(
                                    appDrawerEnum: AppDrawerEnum.settings,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: ElementCardDrawer(
                                title: AppDrawerEnum.imprint.labelName,
                                icon: AppDrawerEnum.imprint.icon,
                                onTap: () {
                                  widget.navigateToPages(
                                    appDrawerEnum: AppDrawerEnum.imprint,
                                  );
                                },
                              ),
                            ),
                            ElementCardDrawer(
                              title: AppDrawerEnum.faq.labelName,
                              icon: AppDrawerEnum.faq.icon,
                              onTap: () {
                                widget.navigateToPages(
                                  appDrawerEnum: AppDrawerEnum.faq,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: state is IsLoginState || state is UserLoadedState
                          ? AppDrawerLogoutWidget(
                              onTap: widget.logout,
                            )
                          : AppDrawerLoginWidget(
                              onTap: widget.backToLogin,
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
