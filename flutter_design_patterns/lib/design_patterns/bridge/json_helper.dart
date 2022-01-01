import 'dart:convert';

import 'package:flutter_design_patterns/design_patterns/bridge/entities/customer.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entities/order.dart';

import 'entities/entity_base.dart';

class JsonHelper {
  const JsonHelper._();

  static String serialiseObject(EntityBase entityBase) {
    return jsonEncode(entityBase);
  }

  static T deserialiseObject<T extends EntityBase>(String jsonString) {
    final json = jsonDecode(jsonString)! as Map<String, dynamic>;

    switch (T) {
      case Customer:
        return Customer.fromJson(json) as T;
      case Order:
        return Order.fromJson(json) as T;
      default:
        throw Exception("Type of '$T' is not supported");
    }
  }
}
