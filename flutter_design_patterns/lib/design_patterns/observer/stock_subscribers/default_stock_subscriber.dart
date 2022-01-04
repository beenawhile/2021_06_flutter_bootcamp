import 'package:flutter_design_patterns/design_patterns/observer/observer.dart';

class DefaultStockSubscriber extends StockSubscriber {
  DefaultStockSubscriber() {
    title = "All stocks";
  }

  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
}
