import 'package:flutter_design_patterns/design_patterns/iterator/graph.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/i_tree_collection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/depth_first_iterator.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/i_tree_iterator.dart';

class DepthFirstTreeColllection implements ITreeCollection {
  final Graph graph;

  const DepthFirstTreeColllection(this.graph);

  @override
  ITreeIterator createIterator() {
    return DepthFirstIterator(this);
  }

  @override
  String getTitle() {
    return "Depth-first";
  }
}
