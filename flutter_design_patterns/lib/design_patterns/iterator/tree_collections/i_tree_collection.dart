import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/i_tree_iterator.dart';

abstract class ITreeCollection {
  ITreeIterator createIterator();
  String getTitle();
}
