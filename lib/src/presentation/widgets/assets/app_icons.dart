import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _asset = 'assets/icons';

/// Default app icons list
enum AppIcons {
  lock('$_asset/lock.svg'),
  dollarSign('$_asset/dollar_sign.svg');

  final String _path;
  const AppIcons(this._path);
}

extension AppIconsExtension on AppIcons {
  Widget icon({double? size, Color? color}) => SvgPicture.asset(
    _path,
    width: size,
    height: size,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
