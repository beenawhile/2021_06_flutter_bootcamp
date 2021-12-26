import 'package:flutter_design_patterns/design_patterns/iterator/graph.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/i_tree_collection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/breadth_first_iterator.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/i_tree_iterator.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const BreadthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return BreadthFirstIterator(this);
  }

  @override
  String getTitle() {
    return "Breadth-first";
  }
}
