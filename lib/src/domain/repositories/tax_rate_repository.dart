import 'package:either_dart/either.dart';
import 'package:financial_wellness/src/domain/entities/entities.dart';
import 'package:financial_wellness/src/domain/exceptions/failures/failures.dart';

abstract class ITaxRateRepository {
  /// Get the current taxes.
  Future<Either<DataFetchFailure, TaxRate>> getTaxes();
}
