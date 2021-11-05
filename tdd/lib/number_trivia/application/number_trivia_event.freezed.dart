// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'number_trivia_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NumberTriviaEventTearOff {
  const _$NumberTriviaEventTearOff();

  GetTriviaForConcreteNumber getTriviaForConcreteNumber(String number) {
    return GetTriviaForConcreteNumber(
      number,
    );
  }

  GetTriviaForRandomNumber getTriviaForRandomNumber() {
    return const GetTriviaForRandomNumber();
  }
}

/// @nodoc
const $NumberTriviaEvent = _$NumberTriviaEventTearOff();

/// @nodoc
mixin _$NumberTriviaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberTriviaEventCopyWith<$Res> {
  factory $NumberTriviaEventCopyWith(
          NumberTriviaEvent value, $Res Function(NumberTriviaEvent) then) =
      _$NumberTriviaEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NumberTriviaEventCopyWithImpl<$Res>
    implements $NumberTriviaEventCopyWith<$Res> {
  _$NumberTriviaEventCopyWithImpl(this._value, this._then);

  final NumberTriviaEvent _value;
  // ignore: unused_field
  final $Res Function(NumberTriviaEvent) _then;
}

/// @nodoc
abstract class $GetTriviaForConcreteNumberCopyWith<$Res> {
  factory $GetTriviaForConcreteNumberCopyWith(GetTriviaForConcreteNumber value,
          $Res Function(GetTriviaForConcreteNumber) then) =
      _$GetTriviaForConcreteNumberCopyWithImpl<$Res>;
  $Res call({String number});
}

/// @nodoc
class _$GetTriviaForConcreteNumberCopyWithImpl<$Res>
    extends _$NumberTriviaEventCopyWithImpl<$Res>
    implements $GetTriviaForConcreteNumberCopyWith<$Res> {
  _$GetTriviaForConcreteNumberCopyWithImpl(GetTriviaForConcreteNumber _value,
      $Res Function(GetTriviaForConcreteNumber) _then)
      : super(_value, (v) => _then(v as GetTriviaForConcreteNumber));

  @override
  GetTriviaForConcreteNumber get _value =>
      super._value as GetTriviaForConcreteNumber;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(GetTriviaForConcreteNumber(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTriviaForConcreteNumber extends GetTriviaForConcreteNumber {
  const _$GetTriviaForConcreteNumber(this.number) : super._();

  @override
  final String number;

  @override
  String toString() {
    return 'NumberTriviaEvent.getTriviaForConcreteNumber(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetTriviaForConcreteNumber &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(number);

  @JsonKey(ignore: true)
  @override
  $GetTriviaForConcreteNumberCopyWith<GetTriviaForConcreteNumber>
      get copyWith =>
          _$GetTriviaForConcreteNumberCopyWithImpl<GetTriviaForConcreteNumber>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber(number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber?.call(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForConcreteNumber != null) {
      return getTriviaForConcreteNumber(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) {
    return getTriviaForConcreteNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForConcreteNumber != null) {
      return getTriviaForConcreteNumber(this);
    }
    return orElse();
  }
}

abstract class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  const factory GetTriviaForConcreteNumber(String number) =
      _$GetTriviaForConcreteNumber;
  const GetTriviaForConcreteNumber._() : super._();

  String get number => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTriviaForConcreteNumberCopyWith<GetTriviaForConcreteNumber>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTriviaForRandomNumberCopyWith<$Res> {
  factory $GetTriviaForRandomNumberCopyWith(GetTriviaForRandomNumber value,
          $Res Function(GetTriviaForRandomNumber) then) =
      _$GetTriviaForRandomNumberCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetTriviaForRandomNumberCopyWithImpl<$Res>
    extends _$NumberTriviaEventCopyWithImpl<$Res>
    implements $GetTriviaForRandomNumberCopyWith<$Res> {
  _$GetTriviaForRandomNumberCopyWithImpl(GetTriviaForRandomNumber _value,
      $Res Function(GetTriviaForRandomNumber) _then)
      : super(_value, (v) => _then(v as GetTriviaForRandomNumber));

  @override
  GetTriviaForRandomNumber get _value =>
      super._value as GetTriviaForRandomNumber;
}

/// @nodoc

class _$GetTriviaForRandomNumber extends GetTriviaForRandomNumber {
  const _$GetTriviaForRandomNumber() : super._();

  @override
  String toString() {
    return 'NumberTriviaEvent.getTriviaForRandomNumber()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetTriviaForRandomNumber);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String number) getTriviaForConcreteNumber,
    required TResult Function() getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String number)? getTriviaForConcreteNumber,
    TResult Function()? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForRandomNumber != null) {
      return getTriviaForRandomNumber();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTriviaForConcreteNumber value)
        getTriviaForConcreteNumber,
    required TResult Function(GetTriviaForRandomNumber value)
        getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
  }) {
    return getTriviaForRandomNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTriviaForConcreteNumber value)?
        getTriviaForConcreteNumber,
    TResult Function(GetTriviaForRandomNumber value)? getTriviaForRandomNumber,
    required TResult orElse(),
  }) {
    if (getTriviaForRandomNumber != null) {
      return getTriviaForRandomNumber(this);
    }
    return orElse();
  }
}

abstract class GetTriviaForRandomNumber extends NumberTriviaEvent {
  const factory GetTriviaForRandomNumber() = _$GetTriviaForRandomNumber;
  const GetTriviaForRandomNumber._() : super._();
}
