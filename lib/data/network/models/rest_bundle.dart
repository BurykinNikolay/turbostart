import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';

import 'network_serializers.dart';

class RestBundle {
  final String key;
  final String data;
  final Uint8List bodyBytes;
  final Serializer serializer;
  final Duration timeout;
  final int status;
  RestBundle({this.key, this.data, this.bodyBytes, this.serializer, this.timeout, this.status});
}

dynamic deserializeBundle(RestBundle bundle) {
  return serializers.deserializeWith(bundle.serializer, jsonDecode(bundle.data));
}
