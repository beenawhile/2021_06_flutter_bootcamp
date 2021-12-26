import 'dart:collection';

import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/depth_first_tree_colllection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/i_tree_iterator.dart';

class DepthFirstIterator implements ITreeIterator {
  final DepthFirstTreeColllection treeCollection;
  final Set<int> visitedNode = <int>{};
  final ListQueue<int> nodeStack = ListQueue<int>();

  final int _initialNode = 1;
  late int _currentNode;

  DepthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  int? getNext() {
    if (!hasNext()) return null;

    // 마지막 것을 꺼내는것 확인 => FILO(Stack)
    _currentNode = nodeStack.removeLast();
    visitedNode.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode]!
          .where((n) => !visitedNode.contains(n))) {
        // connected node인데 stack에 없는 node 추가
        nodeStack.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() {
    return nodeStack.isNotEmpty;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNode.clear();
    nodeStack.clear();
    nodeStack.add(_initialNode);
  }
}
