///
//  Generated code. Do not modify.
//  source: proto/src/main/proto/schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use diceDescriptor instead')
const Dice$json = const {
  '1': 'Dice',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 5, '10': 'number'},
    const {'1': 'diceColor', '3': 2, '4': 1, '5': 14, '6': '.com.grpc.Dice.Type', '10': 'diceColor'},
  ],
  '4': const [Dice_Type$json],
};

@$core.Deprecated('Use diceDescriptor instead')
const Dice_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'white', '2': 0},
    const {'1': 'secondWhite', '2': 1},
    const {'1': 'blue', '2': 2},
    const {'1': 'green', '2': 3},
    const {'1': 'red', '2': 4},
    const {'1': 'yellow', '2': 5},
  ],
};

/// Descriptor for `Dice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List diceDescriptor = $convert.base64Decode('CgREaWNlEhYKBm51bWJlchgBIAEoBVIGbnVtYmVyEjEKCWRpY2VDb2xvchgCIAEoDjITLmNvbS5ncnBjLkRpY2UuVHlwZVIJZGljZUNvbG9yIkwKBFR5cGUSCQoFd2hpdGUQABIPCgtzZWNvbmRXaGl0ZRABEggKBGJsdWUQAhIJCgVncmVlbhADEgcKA3JlZBAEEgoKBnllbGxvdxAF');
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'roomId', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'sixSide', '3': 2, '4': 1, '5': 8, '10': 'sixSide'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEhYKBnJvb21JZBgBIAEoCVIGcm9vbUlkEhgKB3NpeFNpZGUYAiABKAhSB3NpeFNpZGU=');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.com.grpc.Room', '10': 'room'},
    const {'1': 'dices', '3': 3, '4': 3, '5': 11, '6': '.com.grpc.Dice', '10': 'dices'},
    const {'1': 'queue', '3': 4, '4': 1, '5': 5, '10': 'queue'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIiCgRyb29tGAIgASgLMg4uY29tLmdycGMuUm9vbVIEcm9vbRIkCgVkaWNlcxgDIAMoCzIOLmNvbS5ncnBjLkRpY2VSBWRpY2VzEhQKBXF1ZXVlGAQgASgFUgVxdWV1ZQ==');
@$core.Deprecated('Use isStartedDescriptor instead')
const IsStarted$json = const {
  '1': 'IsStarted',
  '2': const [
    const {'1': 'isStarted', '3': 1, '4': 1, '5': 8, '10': 'isStarted'},
    const {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.com.grpc.Room', '10': 'room'},
  ],
};

/// Descriptor for `IsStarted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isStartedDescriptor = $convert.base64Decode('CglJc1N0YXJ0ZWQSHAoJaXNTdGFydGVkGAEgASgIUglpc1N0YXJ0ZWQSIgoEcm9vbRgCIAEoCzIOLmNvbS5ncnBjLlJvb21SBHJvb20=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use userListDescriptor instead')
const UserList$json = const {
  '1': 'UserList',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.com.grpc.User', '10': 'users'},
  ],
};

/// Descriptor for `UserList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListDescriptor = $convert.base64Decode('CghVc2VyTGlzdBIkCgV1c2VycxgBIAMoCzIOLmNvbS5ncnBjLlVzZXJSBXVzZXJz');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 5, '10': 'error'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIUCgVlcnJvchgBIAEoBVIFZXJyb3ISEAoDbXNnGAIgASgJUgNtc2c=');
@$core.Deprecated('Use timeDescriptor instead')
const Time$json = const {
  '1': 'Time',
  '2': const [
    const {'1': 'Time', '3': 1, '4': 1, '5': 5, '10': 'Time'},
    const {'1': 'room', '3': 2, '4': 1, '5': 11, '6': '.com.grpc.Room', '10': 'room'},
  ],
};

/// Descriptor for `Time`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeDescriptor = $convert.base64Decode('CgRUaW1lEhIKBFRpbWUYASABKAVSBFRpbWUSIgoEcm9vbRgCIAEoCzIOLmNvbS5ncnBjLlJvb21SBHJvb20=');
