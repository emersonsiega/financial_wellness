import 'package:financial_wellness/src/domain/entities/interface/interface.dart';

/// Responsible for store any kind of tax rate
class TaxRate extends IEntity {
  /// Annual tax rate
  final double annual;

  TaxRate({required this.annual});
}
