import 'package:financial_wellness/src/src.dart';
import 'package:flutter/material.dart';

/// Custom elevated card with shadow and an icon as the header.
class KalshiCard extends StatelessWidget {
  final Widget child;

  const KalshiCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background.ultraLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: context.colors.foreground.darker.changeOpacity(0.08),
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(context.spacing.lg),

      child: Column(
        children: [
          AppAssets.appIcon.build(height: 48, width: 48),
          context.spacing.lg.vertical,
          child,
        ],
      ),
    );
  }
}
