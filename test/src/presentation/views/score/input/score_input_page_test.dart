import 'package:bloc_test/bloc_test.dart';
import 'package:financial_wellness/src/constants/service_locator.dart';
import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/presentation_test_utils.dart';

class MockScoreInputController extends Mock implements ScoreInputController {}

class FakeUserFinancialData extends Fake implements UserFinancialData {}

void main() {
  late MockGoRouter mockRouter;
  late MockScoreInputController mockController;
  final fakeData = FakeUserFinancialData();

  setUpAll(() {
    registerFallbackValue(fakeData);
    mockController = MockScoreInputController();
    getIt.registerSingleton<ScoreInputController>(mockController);

    mockRouter = MockGoRouter();
    when(() => mockRouter.go(any())).thenAnswer((_) async {});
  });

  group('Success', () {
    setUp(() {
      whenListen(
        mockController,
        Stream.fromIterable([
          ScoreInputState.idle(),
          ScoreInputState.completed(score: FinancialWellnessScore.healthy),
        ]),
      );
      when(() => mockController.state).thenReturn(ScoreInputState.idle());
    });

    testWidgets('Should navigate to result page when state indicates', (
      tester,
    ) async {
      final sut = const ScoreInputPage();

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      await tester.pump();

      verify(
        () => mockRouter.go('/result', extra: FinancialWellnessScore.healthy),
      ).called(1);
      verifyNoMoreInteractions(mockRouter);
    });
  });

  group('Failure', () {
    testWidgets('Should present a snackbar with an error message', (
      tester,
    ) async {
      whenListen(
        mockController,
        Stream.fromIterable([
          ScoreInputState.idle(),
          ScoreInputState.failed(data: fakeData, hasError: true),
        ]),
      );
      when(() => mockController.state).thenReturn(ScoreInputState.idle());

      final sut = const ScoreInputPage();

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Something wrong happened. Try again later!'),
        findsOneWidget,
      );
    });

    testWidgets('Should present error in annual income field', (tester) async {
      whenListen(
        mockController,
        Stream.fromIterable([
          ScoreInputState.idle(),
          ScoreInputState.failed(data: fakeData, isAnnualIncomeInvalid: true),
        ]),
      );
      when(() => mockController.state).thenReturn(ScoreInputState.idle());

      final sut = const ScoreInputPage();

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      await tester.pump();
      expect(find.byType(SnackBar), findsNothing);
      expect(
        find.text('Annual income should be greater than zero'),
        findsOneWidget,
      );
    });

    testWidgets('Should present error in monthly income field', (tester) async {
      whenListen(
        mockController,
        Stream.fromIterable([
          ScoreInputState.idle(),
          ScoreInputState.failed(data: fakeData, isMonthlyCostsIinvalid: true),
        ]),
      );
      when(() => mockController.state).thenReturn(ScoreInputState.idle());

      final sut = const ScoreInputPage();

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      await tester.pump();
      expect(find.byType(SnackBar), findsNothing);
      expect(
        find.text('Monthly costs should be greater than zero'),
        findsOneWidget,
      );
    });
  });
}
