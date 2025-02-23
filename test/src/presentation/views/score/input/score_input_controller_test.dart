import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/presentation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCalculateUserFinancialWellnessScore extends Mock
    implements ICalculateUserFinancialWellnessScore {}

class FakeUserFinancialData extends Fake implements UserFinancialData {}

void main() {
  late ScoreInputController sut;
  final mockUsecase = MockCalculateUserFinancialWellnessScore();
  final fakeData = FakeUserFinancialData();

  setUpAll(() {
    registerFallbackValue(fakeData);
  });

  setUp(() {
    sut = ScoreInputController(mockUsecase);
  });

  group('Success', () {
    setUp(() {
      when(
        () => mockUsecase(any<UserFinancialData>()),
      ).thenAnswer((_) async => const Right(FinancialWellnessScore.healthy));
    });
    blocTest(
      'Should emit a success state with the calculated score',
      build: () => sut,
      act: (sut) => sut.calculate(fakeData),
      expect:
          () => [
            ScoreInputState.loading(data: fakeData),
            ScoreInputState.completed(score: FinancialWellnessScore.healthy),
          ],
    );
  });

  group('Failure', () {
    blocTest(
      'Should emit a failure state with a snackbar error',
      setUp: () {
        when(
          () => mockUsecase(any<UserFinancialData>()),
        ).thenAnswer((_) async => Left([DataFetchFailure.unknown()]));
      },
      build: () => sut,
      act: (sut) => sut.calculate(fakeData),
      expect:
          () => [
            ScoreInputState.loading(data: fakeData),
            ScoreInputState.failed(data: fakeData, hasError: true),
          ],
    );

    blocTest(
      'Should emit a failure state with input errors',
      setUp: () {
        when(() => mockUsecase(any<UserFinancialData>())).thenAnswer(
          (_) async => Left([
            UserFinancialDataValidation.invalidAnnualIncome(),
            UserFinancialDataValidation.invalidMonthlyCosts(),
          ]),
        );
      },
      build: () => sut,
      act: (sut) => sut.calculate(fakeData),
      expect:
          () => [
            ScoreInputState.loading(data: fakeData),
            ScoreInputState.failed(
              data: fakeData,
              isAnnualIncomeInvalid: true,
              isMonthlyCostsIinvalid: true,
            ),
          ],
    );
  });
}
