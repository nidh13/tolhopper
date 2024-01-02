import 'package:flutter/material.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_app_bar/login_logo.dart';
import 'package:tollhopper/features/login/presentation/widgets/login_app_bar/skip_text.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSkipPressed;
  final bool showSkip;
  const LoginAppBar({
    Key? key,
    required this.onSkipPressed,
    this.showSkip = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LoginLogo(),
            ),
          ),
          showSkip
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 8),
                    child: InkWell(
                      onTap: onSkipPressed, // Invoke the callback function
                      child: const SkipText(),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
