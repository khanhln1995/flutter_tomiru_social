import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as graphview;
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';

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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                16.0), // Rounded corners with a radius of 16
          ),
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                    maxWidth: 500), // Set max width of the dialog
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the dialog
                    borderRadius: BorderRadius.circular(
                        16.0), // Match the border radius of the dialog
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                  ), // Padding inside the dialog
                  child: DefaultTabController(
                    length: 2, // Number of tabs
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Thông tin chi tiết'),
                            Tab(text: 'Mạng lưới user'),
                          ],
                          indicator: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors
                                    .blue, // Đặt màu sắc của border là transparent
                                width: 4, // Đặt width của border là 0
                              ),
                            ),
                          ),
                          dividerColor: Colors.transparent,
                          labelColor: Colors
                              .black, // Màu sắc của divider khi tab được chọn
                          unselectedLabelColor: Colors
                              .grey, // Màu sắc của divider khi tab không được chọn
                          labelStyle: TextStyle(
                              fontWeight: FontWeight
                                  .bold), // Kiểu chữ của divider khi tab được chọn
                        ),
                        SizedBox(
                          height: 300, // Adjust the height as needed
                          child: TabBarView(
                            children: [
                              _buildInfoTab(
                                  treeNode), // Content for the Info tab
                              _buildDetailsTab(
                                  treeNode), // Content for the Details tab
                            ],
                          ),
                        ),
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
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNodeWidget(TreeNode treeNode) {
    return GestureDetector(
      onTap: () {
        _showNodeDialog(
            treeNode); // Show dialog with TabBarView when node is tapped
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

  Widget _buildInfoTab(TreeNode treeNode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoField('Name: ${treeNode.firstName} ${treeNode.lastName}'),
          const SizedBox(height: 8.0), // Spacing between fields
          _buildInfoField('Email: ${treeNode.email}'),
          const SizedBox(height: 8.0), // Spacing between fields
          _buildInfoField('Username: ${treeNode.username}'),
          // Add more fields here if needed, but without the special styling
        ],
      ),
    );
  }

  Widget _buildInfoField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(50.0), // Rounded corners
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white), // Text color
      ),
    );
  }

  Widget _buildDetailsTab(TreeNode treeNode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Floor: ${treeNode.floor}'),
          Text('Package Bought At: ${treeNode.buyPackageAt}'),
          // Add more details fields here if needed
        ],
      ),
    );
  }
}
