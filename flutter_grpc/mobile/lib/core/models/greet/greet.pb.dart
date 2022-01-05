///
//  Generated code. Do not modify.
//  source: greet.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Greeting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Greeting', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..hasRequiredFields = false
  ;

  Greeting._() : super();
  factory Greeting({
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final _result = create();
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    return _result;
  }
  factory Greeting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Greeting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Greeting clone() => Greeting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Greeting copyWith(void Function(Greeting) updates) => super.copyWith((message) => updates(message as Greeting)) as Greeting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Greeting create() => Greeting._();
  Greeting createEmptyInstance() => create();
  static $pb.PbList<Greeting> createRepeated() => $pb.PbList<Greeting>();
  @$core.pragma('dart2js:noInline')
  static Greeting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Greeting>(create);
  static Greeting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);
}

class GreetRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOM<Greeting>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'greeting', subBuilder: Greeting.create)
    ..hasRequiredFields = false
  ;

  GreetRequest._() : super();
  factory GreetRequest({
    Greeting? greeting,
  }) {
    final _result = create();
    if (greeting != null) {
      _result.greeting = greeting;
    }
    return _result;
  }
  factory GreetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetRequest clone() => GreetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetRequest copyWith(void Function(GreetRequest) updates) => super.copyWith((message) => updates(message as GreetRequest)) as GreetRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetRequest create() => GreetRequest._();
  GreetRequest createEmptyInstance() => create();
  static $pb.PbList<GreetRequest> createRepeated() => $pb.PbList<GreetRequest>();
  @$core.pragma('dart2js:noInline')
  static GreetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetRequest>(create);
  static GreetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Greeting get greeting => $_getN(0);
  @$pb.TagNumber(1)
  set greeting(Greeting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGreeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearGreeting() => clearField(1);
  @$pb.TagNumber(1)
  Greeting ensureGreeting() => $_ensure(0);
}

class GreetResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  GreetResponse._() : super();
  factory GreetResponse({
    $core.String? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory GreetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetResponse clone() => GreetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetResponse copyWith(void Function(GreetResponse) updates) => super.copyWith((message) => updates(message as GreetResponse)) as GreetResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetResponse create() => GreetResponse._();
  GreetResponse createEmptyInstance() => create();
  static $pb.PbList<GreetResponse> createRepeated() => $pb.PbList<GreetResponse>();
  @$core.pragma('dart2js:noInline')
  static GreetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetResponse>(create);
  static GreetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class GreetManyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetManyRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOM<Greeting>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'greeting', subBuilder: Greeting.create)
    ..hasRequiredFields = false
  ;

  GreetManyRequest._() : super();
  factory GreetManyRequest({
    Greeting? greeting,
  }) {
    final _result = create();
    if (greeting != null) {
      _result.greeting = greeting;
    }
    return _result;
  }
  factory GreetManyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetManyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetManyRequest clone() => GreetManyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetManyRequest copyWith(void Function(GreetManyRequest) updates) => super.copyWith((message) => updates(message as GreetManyRequest)) as GreetManyRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetManyRequest create() => GreetManyRequest._();
  GreetManyRequest createEmptyInstance() => create();
  static $pb.PbList<GreetManyRequest> createRepeated() => $pb.PbList<GreetManyRequest>();
  @$core.pragma('dart2js:noInline')
  static GreetManyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetManyRequest>(create);
  static GreetManyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Greeting get greeting => $_getN(0);
  @$pb.TagNumber(1)
  set greeting(Greeting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGreeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearGreeting() => clearField(1);
  @$pb.TagNumber(1)
  Greeting ensureGreeting() => $_ensure(0);
}

class GreetManyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetManyResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  GreetManyResponse._() : super();
  factory GreetManyResponse({
    $core.String? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory GreetManyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetManyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetManyResponse clone() => GreetManyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetManyResponse copyWith(void Function(GreetManyResponse) updates) => super.copyWith((message) => updates(message as GreetManyResponse)) as GreetManyResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetManyResponse create() => GreetManyResponse._();
  GreetManyResponse createEmptyInstance() => create();
  static $pb.PbList<GreetManyResponse> createRepeated() => $pb.PbList<GreetManyResponse>();
  @$core.pragma('dart2js:noInline')
  static GreetManyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetManyResponse>(create);
  static GreetManyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class LongGreetRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LongGreetRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOM<Greeting>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'greeting', subBuilder: Greeting.create)
    ..hasRequiredFields = false
  ;

  LongGreetRequest._() : super();
  factory LongGreetRequest({
    Greeting? greeting,
  }) {
    final _result = create();
    if (greeting != null) {
      _result.greeting = greeting;
    }
    return _result;
  }
  factory LongGreetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LongGreetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LongGreetRequest clone() => LongGreetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LongGreetRequest copyWith(void Function(LongGreetRequest) updates) => super.copyWith((message) => updates(message as LongGreetRequest)) as LongGreetRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LongGreetRequest create() => LongGreetRequest._();
  LongGreetRequest createEmptyInstance() => create();
  static $pb.PbList<LongGreetRequest> createRepeated() => $pb.PbList<LongGreetRequest>();
  @$core.pragma('dart2js:noInline')
  static LongGreetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LongGreetRequest>(create);
  static LongGreetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Greeting get greeting => $_getN(0);
  @$pb.TagNumber(1)
  set greeting(Greeting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGreeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearGreeting() => clearField(1);
  @$pb.TagNumber(1)
  Greeting ensureGreeting() => $_ensure(0);
}

class LongGreetResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LongGreetResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  LongGreetResponse._() : super();
  factory LongGreetResponse({
    $core.String? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory LongGreetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LongGreetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LongGreetResponse clone() => LongGreetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LongGreetResponse copyWith(void Function(LongGreetResponse) updates) => super.copyWith((message) => updates(message as LongGreetResponse)) as LongGreetResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LongGreetResponse create() => LongGreetResponse._();
  LongGreetResponse createEmptyInstance() => create();
  static $pb.PbList<LongGreetResponse> createRepeated() => $pb.PbList<LongGreetResponse>();
  @$core.pragma('dart2js:noInline')
  static LongGreetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LongGreetResponse>(create);
  static LongGreetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class GreetEveryoneRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetEveryoneRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOM<Greeting>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'greeting', subBuilder: Greeting.create)
    ..hasRequiredFields = false
  ;

  GreetEveryoneRequest._() : super();
  factory GreetEveryoneRequest({
    Greeting? greeting,
  }) {
    final _result = create();
    if (greeting != null) {
      _result.greeting = greeting;
    }
    return _result;
  }
  factory GreetEveryoneRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetEveryoneRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetEveryoneRequest clone() => GreetEveryoneRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetEveryoneRequest copyWith(void Function(GreetEveryoneRequest) updates) => super.copyWith((message) => updates(message as GreetEveryoneRequest)) as GreetEveryoneRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetEveryoneRequest create() => GreetEveryoneRequest._();
  GreetEveryoneRequest createEmptyInstance() => create();
  static $pb.PbList<GreetEveryoneRequest> createRepeated() => $pb.PbList<GreetEveryoneRequest>();
  @$core.pragma('dart2js:noInline')
  static GreetEveryoneRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetEveryoneRequest>(create);
  static GreetEveryoneRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Greeting get greeting => $_getN(0);
  @$pb.TagNumber(1)
  set greeting(Greeting v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGreeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearGreeting() => clearField(1);
  @$pb.TagNumber(1)
  Greeting ensureGreeting() => $_ensure(0);
}

class GreetEveryoneResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GreetEveryoneResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'greet'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  GreetEveryoneResponse._() : super();
  factory GreetEveryoneResponse({
    $core.String? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory GreetEveryoneResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GreetEveryoneResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GreetEveryoneResponse clone() => GreetEveryoneResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GreetEveryoneResponse copyWith(void Function(GreetEveryoneResponse) updates) => super.copyWith((message) => updates(message as GreetEveryoneResponse)) as GreetEveryoneResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GreetEveryoneResponse create() => GreetEveryoneResponse._();
  GreetEveryoneResponse createEmptyInstance() => create();
  static $pb.PbList<GreetEveryoneResponse> createRepeated() => $pb.PbList<GreetEveryoneResponse>();
  @$core.pragma('dart2js:noInline')
  static GreetEveryoneResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GreetEveryoneResponse>(create);
  static GreetEveryoneResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

