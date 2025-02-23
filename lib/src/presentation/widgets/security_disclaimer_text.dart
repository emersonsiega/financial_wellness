import 'package:financial_wellness/src/presentation/translations/translations.dart';
import 'package:financial_wellness/src/src.dart';
import 'package:flutter/material.dart';

class SecurityDisclaimerText extends StatelessWidget {
  const SecurityDisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppIcons.lock.icon(size: 24, color: context.colors.foreground.light),
        Padding(
          padding: EdgeInsets.all(context.spacing.lg),
          child: Text(
            t.shared.score.securityDisclaimer,
            textAlign: TextAlign.center,
            style: context.text.xs.description.copyWith(
              color: context.colors.foreground.regular,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
