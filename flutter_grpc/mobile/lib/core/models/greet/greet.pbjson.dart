///
//  Generated code. Do not modify.
//  source: greet.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use greetingDescriptor instead')
const Greeting$json = const {
  '1': 'Greeting',
  '2': const [
    const {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `Greeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetingDescriptor = $convert.base64Decode('CghHcmVldGluZxIdCgpmaXJzdF9uYW1lGAEgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAIgASgJUghsYXN0TmFtZQ==');
@$core.Deprecated('Use greetRequestDescriptor instead')
const GreetRequest$json = const {
  '1': 'GreetRequest',
  '2': const [
    const {'1': 'greeting', '3': 1, '4': 1, '5': 11, '6': '.greet.Greeting', '10': 'greeting'},
  ],
};

/// Descriptor for `GreetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetRequestDescriptor = $convert.base64Decode('CgxHcmVldFJlcXVlc3QSKwoIZ3JlZXRpbmcYASABKAsyDy5ncmVldC5HcmVldGluZ1IIZ3JlZXRpbmc=');
@$core.Deprecated('Use greetResponseDescriptor instead')
const GreetResponse$json = const {
  '1': 'GreetResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `GreetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetResponseDescriptor = $convert.base64Decode('Cg1HcmVldFJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoCVIGcmVzdWx0');
@$core.Deprecated('Use greetManyRequestDescriptor instead')
const GreetManyRequest$json = const {
  '1': 'GreetManyRequest',
  '2': const [
    const {'1': 'greeting', '3': 1, '4': 1, '5': 11, '6': '.greet.Greeting', '10': 'greeting'},
  ],
};

/// Descriptor for `GreetManyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetManyRequestDescriptor = $convert.base64Decode('ChBHcmVldE1hbnlSZXF1ZXN0EisKCGdyZWV0aW5nGAEgASgLMg8uZ3JlZXQuR3JlZXRpbmdSCGdyZWV0aW5n');
@$core.Deprecated('Use greetManyResponseDescriptor instead')
const GreetManyResponse$json = const {
  '1': 'GreetManyResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `GreetManyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetManyResponseDescriptor = $convert.base64Decode('ChFHcmVldE1hbnlSZXNwb25zZRIWCgZyZXN1bHQYASABKAlSBnJlc3VsdA==');
@$core.Deprecated('Use longGreetRequestDescriptor instead')
const LongGreetRequest$json = const {
  '1': 'LongGreetRequest',
  '2': const [
    const {'1': 'greeting', '3': 1, '4': 1, '5': 11, '6': '.greet.Greeting', '10': 'greeting'},
  ],
};

/// Descriptor for `LongGreetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List longGreetRequestDescriptor = $convert.base64Decode('ChBMb25nR3JlZXRSZXF1ZXN0EisKCGdyZWV0aW5nGAEgASgLMg8uZ3JlZXQuR3JlZXRpbmdSCGdyZWV0aW5n');
@$core.Deprecated('Use longGreetResponseDescriptor instead')
const LongGreetResponse$json = const {
  '1': 'LongGreetResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `LongGreetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List longGreetResponseDescriptor = $convert.base64Decode('ChFMb25nR3JlZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAlSBnJlc3VsdA==');
@$core.Deprecated('Use greetEveryoneRequestDescriptor instead')
const GreetEveryoneRequest$json = const {
  '1': 'GreetEveryoneRequest',
  '2': const [
    const {'1': 'greeting', '3': 1, '4': 1, '5': 11, '6': '.greet.Greeting', '10': 'greeting'},
  ],
};

/// Descriptor for `GreetEveryoneRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetEveryoneRequestDescriptor = $convert.base64Decode('ChRHcmVldEV2ZXJ5b25lUmVxdWVzdBIrCghncmVldGluZxgBIAEoCzIPLmdyZWV0LkdyZWV0aW5nUghncmVldGluZw==');
@$core.Deprecated('Use greetEveryoneResponseDescriptor instead')
const GreetEveryoneResponse$json = const {
  '1': 'GreetEveryoneResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
  ],
};

/// Descriptor for `GreetEveryoneResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List greetEveryoneResponseDescriptor = $convert.base64Decode('ChVHcmVldEV2ZXJ5b25lUmVzcG9uc2USFgoGcmVzdWx0GAEgASgJUgZyZXN1bHQ=');
