import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart' as gv;
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';

class NetTab extends StatefulWidget {
  const NetTab({super.key});

  @override
  _NetTabState createState() => _NetTabState();
}

class _NetTabState extends State<NetTab> {
  final gv.Graph graph = gv.Graph()..isTree = true;
  final gv.BuchheimWalkerConfiguration builder =
      gv.BuchheimWalkerConfiguration();

  TreeResponse? _treeResponse;
  @override
  void initState() {
    super.initState();
    Get.find<BusinessController>().fetchTree();
    _treeResponse = Get.find<BusinessController>().treeResponse;
    String jsonResponse = jsonEncode(_treeResponse!.toJson());
    print(
        '~~~~~~~~~~~~~~~~~~~~~~~~~~~~TREE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    print(jsonResponse);
    print(
        '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

    gv.Node root = gv.Node.Id('Nhánh 1');
    gv.Node branch2 = gv.Node.Id('Nhánh 2');
    gv.Node branch3 = gv.Node.Id('Nhánh 3');

    gv.Node nguyenHuuKien = gv.Node.Id('Nguyễn Hữu Kiên');
    gv.Node leNguyenKhanh = gv.Node.Id('Lê Nguyên Khánh');
    gv.Node nguyenVanA1 = gv.Node.Id('Nguyễn Văn A 1');
    gv.Node nguyenVanA2 = gv.Node.Id('Nguyễn Văn A 2');
    gv.Node nguyenVanB1 = gv.Node.Id('Nguyễn Văn B 1');
    gv.Node nguyenVanB2 = gv.Node.Id('Nguyễn Văn B 2');
    gv.Node nguyenVanB3 = gv.Node.Id('Nguyễn Văn B 3');
    gv.Node nguyenVanC1 = gv.Node.Id('Nguyễn Văn C 1');
    gv.Node nguyenVanC2 = gv.Node.Id('Nguyễn Văn C 2');
    gv.Node nguyenVanD1 = gv.Node.Id('Nguyễn Văn D 1');
    gv.Node nguyenVanD2 = gv.Node.Id('Nguyễn Văn D 2');
    gv.Node nguyenVanE1 = gv.Node.Id('Nguyễn Văn E 1');
    gv.Node nguyenVanE2 = gv.Node.Id('Nguyễn Văn E 2');
    gv.Node nguyenVanF1 = gv.Node.Id('Nguyễn Văn F 1');
    gv.Node nguyenVanF2 = gv.Node.Id('Nguyễn Văn F 2');

    // Building the tree structure
    graph.addEdge(root, nguyenHuuKien);
    graph.addEdge(root, leNguyenKhanh);
    graph.addEdge(nguyenHuuKien, nguyenVanA1);
    graph.addEdge(nguyenHuuKien, nguyenVanA2);
    graph.addEdge(nguyenVanA1, nguyenVanB1);
    graph.addEdge(nguyenVanA2, nguyenVanB2);
    graph.addEdge(nguyenVanB1, nguyenVanC1);
    graph.addEdge(nguyenVanB2, nguyenVanC2);
    graph.addEdge(nguyenVanC1, nguyenVanD1);
    graph.addEdge(nguyenVanC2, nguyenVanD2);
    graph.addEdge(nguyenVanD1, nguyenVanE1);
    graph.addEdge(nguyenVanD2, nguyenVanE2);
    graph.addEdge(nguyenVanE1, nguyenVanF1);
    graph.addEdge(nguyenVanE2, nguyenVanF2);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (gv.BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 5.6,
          child: gv.GraphView(
            graph: graph,
            algorithm: gv.BuchheimWalkerAlgorithm(
                builder, gv.TreeEdgeRenderer(builder)),
            builder: (gv.Node node) {
              return rectangleWidget(node.key!.value as String);
            },
          ),
        ),
      ),
    );
  }

  Widget rectangleWidget(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black, spreadRadius: 1),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
