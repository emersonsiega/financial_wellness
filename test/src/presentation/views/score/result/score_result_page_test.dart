import 'package:financial_wellness/src/domain/entities/entities.dart';
import 'package:financial_wellness/src/presentation/views/score/result/score_result_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/presentation_test_utils.dart';

void main() {
  late MockGoRouter mockRouter;

  setUpAll(() {
    mockRouter = MockGoRouter();
    when(() => mockRouter.replace(any())).thenAnswer((_) async {});
  });

  group('Score result', () {
    testWidgets('Should present the Healthy status', (tester) async {
      final sut = const ScoreResultPage(score: FinancialWellnessScore.healthy);

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      expect(find.text('Congratulations!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is\nHealthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Should present the Average status', (tester) async {
      final sut = const ScoreResultPage(score: FinancialWellnessScore.medium);

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      expect(find.text('There is room for\nimprovement.'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is\nAverage.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Should present the Unhealthy status', (tester) async {
      final sut = const ScoreResultPage(score: FinancialWellnessScore.low);

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      expect(find.text('Caution!'), findsOneWidget);
      expect(
        find.text(
          'Your financial wellness score is\nUnhealthy.',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });
  });

  group('Navigation', () {
    testWidgets('Should return to initial route', (tester) async {
      final sut = const ScoreResultPage(score: FinancialWellnessScore.healthy);

      await tester.pumpWidget(
        buildPresentation(mockRouter: mockRouter, sut: sut),
      );

      await tester.tap(find.text('Return'));
      await tester.pump();

      verify(() => mockRouter.replace('/')).called(1);
      verifyNoMoreInteractions(mockRouter);
    });
  });
}
