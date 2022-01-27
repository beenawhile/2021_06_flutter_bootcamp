import 'dart:async';

import 'package:flutter_design_patterns/design_patterns/observer/observer.dart';

class GamestopStockTicker extends StockTicker {
  GamestopStockTicker() {
    title = StockTickerSymbol.GME.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        setStock(StockTickerSymbol.GME, 16000, 22000);
        notifySubscribers();
      },
    );
  }
}
