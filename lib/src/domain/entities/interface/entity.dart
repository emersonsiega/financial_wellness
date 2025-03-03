import 'package:financial_wellness/src/domain/exceptions/validations/validations.dart';

/// Represents an Entity.
/// Should implement the [validate] method
abstract class IEntity<V extends IValidation> {
  const IEntity();
  
  /// This method can be used to ensure that the data held by the entity is valid according to the business rules.
  ///
  /// If the data is valid, simply return and empty list.
  /// Otherwise return all the field related failed validations:
  /// ```dart
  /// return [MyExampleValidation.fieldARequired(), MyExampleValidation.fieldBInvalid()];
  /// ```
  List<V> validate() => [];
}
