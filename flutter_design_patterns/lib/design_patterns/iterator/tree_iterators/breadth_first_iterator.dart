import 'dart:collection';

import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/breadth_first_tree_collection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_iterators/i_tree_iterator.dart';

class BreadthFirstIterator implements ITreeIterator {
  final BreadthFirstTreeCollection treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  late int _currentNode;

  BreadthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeQueue.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  int? getNext() {
    if (!hasNext()) return null;

    // 첫번째 것을 꺼내는 것을 확인 => FIFO(Queue)
    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode]!
          .where((n) => !visitedNodes.contains(n))) {
        // connected node인데 queue에 없는 node 추가
        nodeQueue.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() {
    return nodeQueue.isNotEmpty;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue.clear();
    nodeQueue.add(_initialNode);
  }
}
