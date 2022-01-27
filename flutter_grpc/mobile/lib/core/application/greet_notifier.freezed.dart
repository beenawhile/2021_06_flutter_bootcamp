// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'greet_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GreetStateTearOff {
  const _$GreetStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _GreetOnceSuccess greetOnceSuccess(String result) {
    return _GreetOnceSuccess(
      result,
    );
  }

  _GreetManySuccess greetManySuccess(String result) {
    return _GreetManySuccess(
      result,
    );
  }

  _LongGreetSuccess longGreetSuccess(String result) {
    return _LongGreetSuccess(
      result,
    );
  }

  _GreetEveryoneSuccess greetEveryoneSuccess(String result) {
    return _GreetEveryoneSuccess(
      result,
    );
  }

  _GreetFailure greetFailure(String exception) {
    return _GreetFailure(
      exception,
    );
  }
}

/// @nodoc
const $GreetState = _$GreetStateTearOff();

/// @nodoc
mixin _$GreetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GreetStateCopyWith<$Res> {
  factory $GreetStateCopyWith(
          GreetState value, $Res Function(GreetState) then) =
      _$GreetStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GreetStateCopyWithImpl<$Res> implements $GreetStateCopyWith<$Res> {
  _$GreetStateCopyWithImpl(this._value, this._then);

  final GreetState _value;
  // ignore: unused_field
  final $Res Function(GreetState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$GreetStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'GreetState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends GreetState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$GreetStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'GreetState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends GreetState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$GreetOnceSuccessCopyWith<$Res> {
  factory _$GreetOnceSuccessCopyWith(
          _GreetOnceSuccess value, $Res Function(_GreetOnceSuccess) then) =
      __$GreetOnceSuccessCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class __$GreetOnceSuccessCopyWithImpl<$Res>
    extends _$GreetStateCopyWithImpl<$Res>
    implements _$GreetOnceSuccessCopyWith<$Res> {
  __$GreetOnceSuccessCopyWithImpl(
      _GreetOnceSuccess _value, $Res Function(_GreetOnceSuccess) _then)
      : super(_value, (v) => _then(v as _GreetOnceSuccess));

  @override
  _GreetOnceSuccess get _value => super._value as _GreetOnceSuccess;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_GreetOnceSuccess(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GreetOnceSuccess extends _GreetOnceSuccess {
  const _$_GreetOnceSuccess(this.result) : super._();

  @override
  final String result;

  @override
  String toString() {
    return 'GreetState.greetOnceSuccess(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GreetOnceSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  _$GreetOnceSuccessCopyWith<_GreetOnceSuccess> get copyWith =>
      __$GreetOnceSuccessCopyWithImpl<_GreetOnceSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return greetOnceSuccess(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return greetOnceSuccess?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetOnceSuccess != null) {
      return greetOnceSuccess(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return greetOnceSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return greetOnceSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetOnceSuccess != null) {
      return greetOnceSuccess(this);
    }
    return orElse();
  }
}

abstract class _GreetOnceSuccess extends GreetState {
  const factory _GreetOnceSuccess(String result) = _$_GreetOnceSuccess;
  const _GreetOnceSuccess._() : super._();

  String get result;
  @JsonKey(ignore: true)
  _$GreetOnceSuccessCopyWith<_GreetOnceSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GreetManySuccessCopyWith<$Res> {
  factory _$GreetManySuccessCopyWith(
          _GreetManySuccess value, $Res Function(_GreetManySuccess) then) =
      __$GreetManySuccessCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class __$GreetManySuccessCopyWithImpl<$Res>
    extends _$GreetStateCopyWithImpl<$Res>
    implements _$GreetManySuccessCopyWith<$Res> {
  __$GreetManySuccessCopyWithImpl(
      _GreetManySuccess _value, $Res Function(_GreetManySuccess) _then)
      : super(_value, (v) => _then(v as _GreetManySuccess));

  @override
  _GreetManySuccess get _value => super._value as _GreetManySuccess;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_GreetManySuccess(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GreetManySuccess extends _GreetManySuccess {
  const _$_GreetManySuccess(this.result) : super._();

  @override
  final String result;

  @override
  String toString() {
    return 'GreetState.greetManySuccess(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GreetManySuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  _$GreetManySuccessCopyWith<_GreetManySuccess> get copyWith =>
      __$GreetManySuccessCopyWithImpl<_GreetManySuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return greetManySuccess(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return greetManySuccess?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetManySuccess != null) {
      return greetManySuccess(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return greetManySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return greetManySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetManySuccess != null) {
      return greetManySuccess(this);
    }
    return orElse();
  }
}

abstract class _GreetManySuccess extends GreetState {
  const factory _GreetManySuccess(String result) = _$_GreetManySuccess;
  const _GreetManySuccess._() : super._();

  String get result;
  @JsonKey(ignore: true)
  _$GreetManySuccessCopyWith<_GreetManySuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LongGreetSuccessCopyWith<$Res> {
  factory _$LongGreetSuccessCopyWith(
          _LongGreetSuccess value, $Res Function(_LongGreetSuccess) then) =
      __$LongGreetSuccessCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class __$LongGreetSuccessCopyWithImpl<$Res>
    extends _$GreetStateCopyWithImpl<$Res>
    implements _$LongGreetSuccessCopyWith<$Res> {
  __$LongGreetSuccessCopyWithImpl(
      _LongGreetSuccess _value, $Res Function(_LongGreetSuccess) _then)
      : super(_value, (v) => _then(v as _LongGreetSuccess));

  @override
  _LongGreetSuccess get _value => super._value as _LongGreetSuccess;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_LongGreetSuccess(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LongGreetSuccess extends _LongGreetSuccess {
  const _$_LongGreetSuccess(this.result) : super._();

  @override
  final String result;

  @override
  String toString() {
    return 'GreetState.longGreetSuccess(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LongGreetSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  _$LongGreetSuccessCopyWith<_LongGreetSuccess> get copyWith =>
      __$LongGreetSuccessCopyWithImpl<_LongGreetSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return longGreetSuccess(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return longGreetSuccess?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (longGreetSuccess != null) {
      return longGreetSuccess(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return longGreetSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return longGreetSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (longGreetSuccess != null) {
      return longGreetSuccess(this);
    }
    return orElse();
  }
}

abstract class _LongGreetSuccess extends GreetState {
  const factory _LongGreetSuccess(String result) = _$_LongGreetSuccess;
  const _LongGreetSuccess._() : super._();

  String get result;
  @JsonKey(ignore: true)
  _$LongGreetSuccessCopyWith<_LongGreetSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GreetEveryoneSuccessCopyWith<$Res> {
  factory _$GreetEveryoneSuccessCopyWith(_GreetEveryoneSuccess value,
          $Res Function(_GreetEveryoneSuccess) then) =
      __$GreetEveryoneSuccessCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class __$GreetEveryoneSuccessCopyWithImpl<$Res>
    extends _$GreetStateCopyWithImpl<$Res>
    implements _$GreetEveryoneSuccessCopyWith<$Res> {
  __$GreetEveryoneSuccessCopyWithImpl(
      _GreetEveryoneSuccess _value, $Res Function(_GreetEveryoneSuccess) _then)
      : super(_value, (v) => _then(v as _GreetEveryoneSuccess));

  @override
  _GreetEveryoneSuccess get _value => super._value as _GreetEveryoneSuccess;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_GreetEveryoneSuccess(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GreetEveryoneSuccess extends _GreetEveryoneSuccess {
  const _$_GreetEveryoneSuccess(this.result) : super._();

  @override
  final String result;

  @override
  String toString() {
    return 'GreetState.greetEveryoneSuccess(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GreetEveryoneSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  _$GreetEveryoneSuccessCopyWith<_GreetEveryoneSuccess> get copyWith =>
      __$GreetEveryoneSuccessCopyWithImpl<_GreetEveryoneSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return greetEveryoneSuccess(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return greetEveryoneSuccess?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetEveryoneSuccess != null) {
      return greetEveryoneSuccess(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return greetEveryoneSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return greetEveryoneSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetEveryoneSuccess != null) {
      return greetEveryoneSuccess(this);
    }
    return orElse();
  }
}

abstract class _GreetEveryoneSuccess extends GreetState {
  const factory _GreetEveryoneSuccess(String result) = _$_GreetEveryoneSuccess;
  const _GreetEveryoneSuccess._() : super._();

  String get result;
  @JsonKey(ignore: true)
  _$GreetEveryoneSuccessCopyWith<_GreetEveryoneSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GreetFailureCopyWith<$Res> {
  factory _$GreetFailureCopyWith(
          _GreetFailure value, $Res Function(_GreetFailure) then) =
      __$GreetFailureCopyWithImpl<$Res>;
  $Res call({String exception});
}

/// @nodoc
class __$GreetFailureCopyWithImpl<$Res> extends _$GreetStateCopyWithImpl<$Res>
    implements _$GreetFailureCopyWith<$Res> {
  __$GreetFailureCopyWithImpl(
      _GreetFailure _value, $Res Function(_GreetFailure) _then)
      : super(_value, (v) => _then(v as _GreetFailure));

  @override
  _GreetFailure get _value => super._value as _GreetFailure;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_GreetFailure(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GreetFailure extends _GreetFailure {
  const _$_GreetFailure(this.exception) : super._();

  @override
  final String exception;

  @override
  String toString() {
    return 'GreetState.greetFailure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GreetFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  _$GreetFailureCopyWith<_GreetFailure> get copyWith =>
      __$GreetFailureCopyWithImpl<_GreetFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String result) greetOnceSuccess,
    required TResult Function(String result) greetManySuccess,
    required TResult Function(String result) longGreetSuccess,
    required TResult Function(String result) greetEveryoneSuccess,
    required TResult Function(String exception) greetFailure,
  }) {
    return greetFailure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
  }) {
    return greetFailure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String result)? greetOnceSuccess,
    TResult Function(String result)? greetManySuccess,
    TResult Function(String result)? longGreetSuccess,
    TResult Function(String result)? greetEveryoneSuccess,
    TResult Function(String exception)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetFailure != null) {
      return greetFailure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GreetOnceSuccess value) greetOnceSuccess,
    required TResult Function(_GreetManySuccess value) greetManySuccess,
    required TResult Function(_LongGreetSuccess value) longGreetSuccess,
    required TResult Function(_GreetEveryoneSuccess value) greetEveryoneSuccess,
    required TResult Function(_GreetFailure value) greetFailure,
  }) {
    return greetFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
  }) {
    return greetFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GreetOnceSuccess value)? greetOnceSuccess,
    TResult Function(_GreetManySuccess value)? greetManySuccess,
    TResult Function(_LongGreetSuccess value)? longGreetSuccess,
    TResult Function(_GreetEveryoneSuccess value)? greetEveryoneSuccess,
    TResult Function(_GreetFailure value)? greetFailure,
    required TResult orElse(),
  }) {
    if (greetFailure != null) {
      return greetFailure(this);
    }
    return orElse();
  }
}

abstract class _GreetFailure extends GreetState {
  const factory _GreetFailure(String exception) = _$_GreetFailure;
  const _GreetFailure._() : super._();

  String get exception;
  @JsonKey(ignore: true)
  _$GreetFailureCopyWith<_GreetFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
