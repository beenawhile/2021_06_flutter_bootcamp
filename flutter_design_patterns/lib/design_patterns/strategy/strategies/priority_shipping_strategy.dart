import 'package:flutter_design_patterns/design_patterns/strategy/i_shipping_cost_strategy.dart';
import 'package:flutter_design_patterns/design_patterns/strategy/order/order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = "Priority shipping";

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
