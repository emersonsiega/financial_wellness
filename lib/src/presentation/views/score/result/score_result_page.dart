import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScoreResultPage extends StatelessWidget {
  final FinancialWellnessScore score;
  const ScoreResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Text('Score result ${score.name}'),
    );
  }
}
