import 'package:financial_wellness/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    super.key,
  });

  final MockGoRouter goRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      InheritedGoRouter(goRouter: goRouter, child: child);
}

MaterialApp buildPresentation({
  required MockGoRouter mockRouter,
  required Widget sut,
}) {
  return MaterialApp(
    theme: AppTheme.buildTheme(),
    home: MockGoRouterProvider(goRouter: mockRouter, child: sut),
  );
}
