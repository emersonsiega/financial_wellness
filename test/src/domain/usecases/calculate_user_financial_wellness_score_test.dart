import 'package:either_dart/either.dart';
import 'package:financial_wellness/src/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockTaxRateRepository extends Mock implements ITaxRateRepository {}

void main() {
  late final ITaxRateRepository repositoryMock;
  late final ICalculateUserFinancialWellnessScore sut;

  setUpAll(() {
    repositoryMock = MockTaxRateRepository();
    sut = CalculateUserFinancialWellnessScore(repositoryMock);
  });

  group('Failure', () {
    test('Should inform invalid MonthlyCosts', () async {
      final response = await sut.call(UserFinancialData(annualIncome: 1000));
      expect(response.isLeft, isTrue);
      expect(
        response.left,
        contains(UserFinancialDataValidation.invalidMonthlyCosts()),
      );
    });

    test('Should inform data fetch failure', () async {
      when(
        repositoryMock.getTaxes,
      ).thenAnswer((_) async => Left(DataFetchFailure.unknown()));

      final response = await sut.call(
        UserFinancialData(annualIncome: 1000, monthlyCosts: 10),
      );
      expect(response.isLeft, isTrue);
      expect(response.left, contains(DataFetchFailure.unknown()));
    });
  });

  group('Success', () {
    setUpAll(() {
      when(
        repositoryMock.getTaxes,
      ).thenAnswer((_) async => Right(TaxRate(annual: 0.08)));
    });

    test('Should calculate a healthy score', () async {
      final response = await sut.call(
        UserFinancialData(annualIncome: 1000, monthlyCosts: 10),
      );
      expect(response.isRight, isTrue);
      expect(response.right, FinancialWellnessScore.healthy);
    });

    test('Should calculate a medium score', () async {
      final response = await sut.call(
        UserFinancialData(annualIncome: 1000, monthlyCosts: 30),
      );
      expect(response.isRight, isTrue);
      expect(response.right, FinancialWellnessScore.medium);
    });

    test('Should calculate a low score', () async {
      final response = await sut.call(
        UserFinancialData(annualIncome: 1000, monthlyCosts: 80),
      );
      expect(response.isRight, isTrue);
      expect(response.right, FinancialWellnessScore.low);
    });
  });
}
