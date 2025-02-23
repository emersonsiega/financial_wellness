import 'package:either_dart/either.dart';
import 'package:financial_wellness/src/constants/constants.dart';
import 'package:financial_wellness/src/domain/domain.dart';

/// Local implementation of [ITaxRateRepository].
class LocalTaxRateRepository implements ITaxRateRepository {
  @override
  Future<Either<DataFetchFailure, TaxRate>> getTaxes() async {
    final currentTaxes = TaxRate(annual: AppConstants.annualTaxRate);
    return Right(currentTaxes);
  }
}
