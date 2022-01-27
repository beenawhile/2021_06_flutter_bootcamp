enum StockTickerSymbol {
  GME,
  GOOGL,
  TSLA,
}

extension StockTickerSymbolX on StockTickerSymbol {
  String toShortString() => toString().split(".").last;
}
