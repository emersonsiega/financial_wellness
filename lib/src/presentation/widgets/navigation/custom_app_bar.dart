import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/widgets/assets/assets.dart';
import 'package:flutter/material.dart';

/// Custom [AppBar] with the Kalshi logo.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: const SizedBox(),
      title: AppAssets.kalshiLogo.build(
        height: 20,
        color: context.colors.foreground.ultraDark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
