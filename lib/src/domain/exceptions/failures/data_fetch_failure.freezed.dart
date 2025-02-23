// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_fetch_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DataFetchFailure {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataFetchFailed value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataFetchFailed value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataFetchFailed value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of DataFetchFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataFetchFailureCopyWith<DataFetchFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFetchFailureCopyWith<$Res> {
  factory $DataFetchFailureCopyWith(
    DataFetchFailure value,
    $Res Function(DataFetchFailure) then,
  ) = _$DataFetchFailureCopyWithImpl<$Res, DataFetchFailure>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$DataFetchFailureCopyWithImpl<$Res, $Val extends DataFetchFailure>
    implements $DataFetchFailureCopyWith<$Res> {
  _$DataFetchFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataFetchFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _value.copyWith(
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataFetchFailedImplCopyWith<$Res>
    implements $DataFetchFailureCopyWith<$Res> {
  factory _$$DataFetchFailedImplCopyWith(
    _$DataFetchFailedImpl value,
    $Res Function(_$DataFetchFailedImpl) then,
  ) = __$$DataFetchFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$DataFetchFailedImplCopyWithImpl<$Res>
    extends _$DataFetchFailureCopyWithImpl<$Res, _$DataFetchFailedImpl>
    implements _$$DataFetchFailedImplCopyWith<$Res> {
  __$$DataFetchFailedImplCopyWithImpl(
    _$DataFetchFailedImpl _value,
    $Res Function(_$DataFetchFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DataFetchFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _$DataFetchFailedImpl(
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$DataFetchFailedImpl extends DataFetchFailed {
  _$DataFetchFailedImpl({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'DataFetchFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataFetchFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataFetchFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataFetchFailedImplCopyWith<_$DataFetchFailedImpl> get copyWith =>
      __$$DataFetchFailedImplCopyWithImpl<_$DataFetchFailedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataFetchFailed value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DataFetchFailed value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataFetchFailed value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class DataFetchFailed extends DataFetchFailure {
  factory DataFetchFailed({final String? message}) = _$DataFetchFailedImpl;
  DataFetchFailed._() : super._();

  @override
  String? get message;

  /// Create a copy of DataFetchFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataFetchFailedImplCopyWith<_$DataFetchFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
