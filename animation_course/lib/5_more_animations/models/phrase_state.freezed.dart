// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phrase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhraseModelTearOff {
  const _$PhraseModelTearOff();

  _PhraseModel call({required String phrase, bool like = false}) {
    return _PhraseModel(
      phrase: phrase,
      like: like,
    );
  }
}

/// @nodoc
const $PhraseModel = _$PhraseModelTearOff();

/// @nodoc
mixin _$PhraseModel {
  String get phrase => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhraseModelCopyWith<PhraseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseModelCopyWith<$Res> {
  factory $PhraseModelCopyWith(
          PhraseModel value, $Res Function(PhraseModel) then) =
      _$PhraseModelCopyWithImpl<$Res>;
  $Res call({String phrase, bool like});
}

/// @nodoc
class _$PhraseModelCopyWithImpl<$Res> implements $PhraseModelCopyWith<$Res> {
  _$PhraseModelCopyWithImpl(this._value, this._then);

  final PhraseModel _value;
  // ignore: unused_field
  final $Res Function(PhraseModel) _then;

  @override
  $Res call({
    Object? phrase = freezed,
    Object? like = freezed,
  }) {
    return _then(_value.copyWith(
      phrase: phrase == freezed
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PhraseModelCopyWith<$Res>
    implements $PhraseModelCopyWith<$Res> {
  factory _$PhraseModelCopyWith(
          _PhraseModel value, $Res Function(_PhraseModel) then) =
      __$PhraseModelCopyWithImpl<$Res>;
  @override
  $Res call({String phrase, bool like});
}

/// @nodoc
class __$PhraseModelCopyWithImpl<$Res> extends _$PhraseModelCopyWithImpl<$Res>
    implements _$PhraseModelCopyWith<$Res> {
  __$PhraseModelCopyWithImpl(
      _PhraseModel _value, $Res Function(_PhraseModel) _then)
      : super(_value, (v) => _then(v as _PhraseModel));

  @override
  _PhraseModel get _value => super._value as _PhraseModel;

  @override
  $Res call({
    Object? phrase = freezed,
    Object? like = freezed,
  }) {
    return _then(_PhraseModel(
      phrase: phrase == freezed
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PhraseModel extends _PhraseModel {
  const _$_PhraseModel({required this.phrase, this.like = false}) : super._();

  @override
  final String phrase;
  @JsonKey(defaultValue: false)
  @override
  final bool like;

  @override
  String toString() {
    return 'PhraseModel(phrase: $phrase, like: $like)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhraseModel &&
            (identical(other.phrase, phrase) ||
                const DeepCollectionEquality().equals(other.phrase, phrase)) &&
            (identical(other.like, like) ||
                const DeepCollectionEquality().equals(other.like, like)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phrase) ^
      const DeepCollectionEquality().hash(like);

  @JsonKey(ignore: true)
  @override
  _$PhraseModelCopyWith<_PhraseModel> get copyWith =>
      __$PhraseModelCopyWithImpl<_PhraseModel>(this, _$identity);
}

abstract class _PhraseModel extends PhraseModel {
  const factory _PhraseModel({required String phrase, bool like}) =
      _$_PhraseModel;
  const _PhraseModel._() : super._();

  @override
  String get phrase => throw _privateConstructorUsedError;
  @override
  bool get like => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhraseModelCopyWith<_PhraseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
