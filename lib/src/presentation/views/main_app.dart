import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/src.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en')],
      theme: AppTheme.buildTheme(),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            name: 'score',
            path: '/',
            builder: (context, state) => const ScoreInputPage(),
            routes: [
              GoRoute(
                name: 'result',
                path: '/result',
                builder: (context, state) {
                  assert(
                    state.extra is FinancialWellnessScore,
                    'Result page requires an FinancialWellnessScore as argument.',
                  );

                  final score = state.extra as FinancialWellnessScore;
                  return ScoreResultPage(score: score);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
