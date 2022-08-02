///
//  Generated code. Do not modify.
//  source: src/main/proto/schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Dice_Type extends $pb.ProtobufEnum {
  static const Dice_Type white = Dice_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'white');
  static const Dice_Type secondWhite = Dice_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'secondWhite');
  static const Dice_Type blue = Dice_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'blue');
  static const Dice_Type green = Dice_Type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'green');
  static const Dice_Type red = Dice_Type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'red');
  static const Dice_Type yellow = Dice_Type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'yellow');

  static const $core.List<Dice_Type> values = <Dice_Type> [
    white,
    secondWhite,
    blue,
    green,
    red,
    yellow,
  ];

  static final $core.Map<$core.int, Dice_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Dice_Type? valueOf($core.int value) => _byValue[value];

  const Dice_Type._($core.int v, $core.String n) : super(v, n);
}

