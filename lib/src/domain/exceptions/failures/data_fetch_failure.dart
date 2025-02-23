import 'package:financial_wellness/src/domain/exceptions/failures/interface/interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_fetch_failure.freezed.dart';

/// Represents any type of failure returned during a data fetching action
@freezed
sealed class DataFetchFailure extends IFailure with _$DataFetchFailure {
  const DataFetchFailure._();

  factory DataFetchFailure.unknown({String? message}) = DataFetchFailed;
}
