import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoreInputPage extends StatelessWidget {
  const ScoreInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.go('/result', extra: FinancialWellnessScore.healthy);
          },
          icon: AppIcons.dollarSign.icon(),
        ),
      ),
    );
  }
}
