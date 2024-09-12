import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:intl/intl.dart';
import "package:tomiru_social_flutter/features/bussiness/Widgets/net_tab_detail.dart";

class NetTab extends StatefulWidget {
  const NetTab({super.key});
  @override
  _NetTabState createState() => _NetTabState();
}

class _NetTabState extends State<NetTab> {
  final graphview.Graph graph = graphview.Graph()..isTree = true;
  final graphview.BuchheimWalkerConfiguration builder =
      graphview.BuchheimWalkerConfiguration();
  final BusinessController _businessController = Get.find<BusinessController>();

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchAndBuildGraph();
    _configureGraph();
  }

  void _configureGraph() {
    builder
      ..siblingSeparation = (20)
      ..levelSeparation = (100)
      ..subtreeSeparation = (30)
      ..orientation =
          graphview.BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  Future<void> _fetchAndBuildGraph() async {
    try {
      print("calling api");
      TreeResponse treeResponse = await _businessController.fetchTree();
      List<TreeNode>? rootNode = _businessController.treeData;

      if (rootNode != null && rootNode.isNotEmpty) {
        print("-------------------------");
        print(jsonEncode(rootNode));
        print("-------------------------");
        _buildGraph(
            rootNode.first); // Using the first element as the grandparent node
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load tree data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _buildGraph(TreeNode treeNode) {
    graphview.Node rootGraphNode = _createGraphNode(treeNode);
    _addChildren(treeNode, rootGraphNode);
  }

  void _addChildren(TreeNode treeNode, graphview.Node parentGraphNode) {
    for (var child in treeNode.children) {
      graphview.Node childGraphNode = _createGraphNode(child);
      graph.addEdge(parentGraphNode, childGraphNode);
      if (child.children.isNotEmpty) {
        _addChildren(child, childGraphNode);
      }
    }
  }

  graphview.Node _createGraphNode(TreeNode treeNode) {
    return graphview.Node.Id(treeNode);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Tree'),
      ),
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 5.0,
          child: graphview.GraphView(
            graph: graph,
            algorithm: graphview.BuchheimWalkerAlgorithm(
              builder,
              graphview.TreeEdgeRenderer(builder),
            ),
            builder: (graphview.Node node) {
              TreeNode treeNode = node.key!.value as TreeNode;
              return _buildNodeWidget(treeNode);
            },
          ),
        ),
      ),
    );
  }

  bool showIndicator = false;
  void _toggleIndicator(bool value) {
    showIndicator = value;
  }

  void _showNodeDialog(TreeNode treeNode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NodeDialogWidget(treeNode: treeNode);
      },
    );
  }

  Widget _buildNodeWidget(TreeNode treeNode) {
    return GestureDetector(
      onTap: () {
        _showNodeDialog(
            treeNode); // Show dialog with TabBarView when node is tapped
        // _fetchDetailTreeData(treeNode);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: treeNode.isF1 ? Colors.greenAccent : Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${treeNode.firstName} ${treeNode.lastName}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              treeNode.username,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
