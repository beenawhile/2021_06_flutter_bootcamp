import 'package:flutter_design_patterns/design_patterns/strategy/i_shipping_cost_strategy.dart';
import 'package:flutter_design_patterns/design_patterns/strategy/order/order.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = "In-store pickup";

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
