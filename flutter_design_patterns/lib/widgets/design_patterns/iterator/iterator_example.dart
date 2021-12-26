import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/layout_constants.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/graph.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/breadth_first_tree_collection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/depth_first_tree_colllection.dart';
import 'package:flutter_design_patterns/design_patterns/iterator/tree_collections/i_tree_collection.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/iterator/box.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/iterator/tree_collection_selection.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class IteratorExample extends StatefulWidget {
  const IteratorExample({Key? key}) : super(key: key);

  @override
  _IteratorExampleState createState() => _IteratorExampleState();
}

class _IteratorExampleState extends State<IteratorExample> {
  final List<ITreeCollection> treeCollection = [];

  int _selectedTreeCollectionIndex = 0;
  int? _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();

    final graph = _buildGraph();
    treeCollection.add(BreadthFirstTreeCollection(graph));
    treeCollection.add(DepthFirstTreeColllection(graph));
  }

  void _setSelectedTreeCollectionIndex(int? index) {
    setState(() {
      _selectedTreeCollectionIndex = index!;
    });
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  void _reset() {
    setState(() {
      _currentNodeIndex = 0;
    });
  }

  Future _traverseTree() async {
    _toggleIsTraversing();

    final iterator =
        treeCollection[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      setState(() {
        _currentNodeIndex = iterator.getNext();
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _toggleIsTraversing();
  }

  Color _getBackgroundColor(int index) {
    return _currentNodeIndex == index ? Colors.red[200]! : Colors.white;
  }

  Graph _buildGraph() {
    final graph = Graph();

    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(3, 7);
    graph.addEdge(4, 8);

    return graph;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: [
            TreeCollectionSelection(
              treeCollections: treeCollection,
              selectedIndex: _selectedTreeCollectionIndex,
              onChanged:
                  !_isTraversing ? _setSelectedTreeCollectionIndex : null,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                PlatformButton(
                  text: "Traverse",
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed: _currentNodeIndex == 0 ? _traverseTree : null,
                ),
                PlatformButton(
                  text: "Cancel",
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed:
                      _isTraversing || _currentNodeIndex == 0 ? null : _reset,
                ),
              ],
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            Box(
              nodeId: 1,
              color: _getBackgroundColor(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Box(
                    nodeId: 2,
                    color: _getBackgroundColor(2),
                    child: Box(nodeId: 5, color: _getBackgroundColor(5)),
                  ),
                  Box(
                    nodeId: 3,
                    color: _getBackgroundColor(3),
                    child: Row(
                      children: [
                        Box(nodeId: 6, color: _getBackgroundColor(6)),
                        Box(nodeId: 7, color: _getBackgroundColor(7)),
                      ],
                    ),
                  ),
                  Box(
                    nodeId: 4,
                    color: _getBackgroundColor(4),
                    child: Box(nodeId: 8, color: _getBackgroundColor(8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
