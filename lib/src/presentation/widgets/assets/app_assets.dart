import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const _images = 'assets/images';

/// Default app assets list
enum AppAssets {
  appIcon('$_images/app_icon.svg'),
  kalshiLogo('$_images/kalshi_logo.svg');

  final String _path;
  const AppAssets(this._path);
}

extension AppAssetsExtension on AppAssets {
  Widget build({
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
    Color? color,
  }) => SvgPicture.asset(
    _path,
    fit: fit,
    width: width,
    height: height,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
