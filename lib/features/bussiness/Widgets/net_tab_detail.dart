import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:intl/intl.dart';

class NodeDialogWidget extends StatefulWidget {
  final TreeNode treeNode;

  const NodeDialogWidget({super.key, required this.treeNode});

  @override
  _NodeDialogWidgetState createState() => _NodeDialogWidgetState();
}

class _NodeDialogWidgetState extends State<NodeDialogWidget> {
  final graphview.Graph graph = graphview.Graph()..isTree = true;
  final graphview.BuchheimWalkerConfiguration builder =
      graphview.BuchheimWalkerConfiguration();
  final BusinessController _businessController = Get.find<BusinessController>();

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchAndBuildGraph2();
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

  Future<void> _fetchAndBuildGraph2() async {
    Map<String, String> filters = {
      'filters[username]': widget.treeNode.username
    };

    try {
      TreeResponse treeResponse2 =
          await _businessController.fetchTreeDetail(filters: filters);
      List<TreeNode>? rootNode2 = _businessController.treeDataDetail;

      if (rootNode2 != null && rootNode2.isNotEmpty) {
        print("-------------------------");
        print(jsonEncode(rootNode2));
        print("-------------------------");
        _buildGraph(
            rootNode2.first); // Using the first element as the grandparent node
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      tabs: [
                        Tab(text: 'Thông tin chi tiết'),
                        Tab(text: 'Mạng lưới user'),
                      ],
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 4,
                          ),
                        ),
                      ),
                      dividerColor: Colors.transparent,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildInfoTab(widget.treeNode),
                          _buildDetailsTab(widget.treeNode),
                        ],
                      ),
                    ),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (_errorMessage != null)
                      Center(child: Text('Error: $_errorMessage'))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTab(TreeNode treeNode) {
    String formattedDate = '';
    String formattedTime = '';

    if (treeNode.createdAt != null) {
      try {
        int createdAtMillis = int.parse(treeNode.createdAt);
        DateTime createdAtDateTime =
            DateTime.fromMillisecondsSinceEpoch(createdAtMillis);
        formattedDate = DateFormat('dd/MM/yyyy').format(createdAtDateTime);
        formattedTime = DateFormat('HH:mm:ss').format(createdAtDateTime);
      } catch (e) {
        print('Error parsing createdAt: $e');
      }
    } else {
      print("CreatedAt is Null");
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoLabel('Họ tên: '),
              Text('${treeNode.firstName} ${treeNode.lastName}'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoLabel('Username: '),
              Text(treeNode.username),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoLabel('Ngày đăng kí: '),
              treeNode.createdAt == null
                  ? const Text('Not Created')
                  : Text('$formattedDate - $formattedTime'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoLabel('Quan hệ: '),
              treeNode.isF1 ? const Text('F1') : const Text('Not F1'),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoLabel('Cấp bậc: '),
              treeNode.isF1
                  ? const Text('Free Member')
                  : const Text('Not Member'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(TreeNode treeNode) {
    if (graph.nodes.isEmpty) {
      return const Center(child: Text('No data available'));
    }
    return Scaffold(
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

  Widget _buildNodeWidget(TreeNode treeNode) {
    return GestureDetector(
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

  Widget _buildInfoLabel(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
