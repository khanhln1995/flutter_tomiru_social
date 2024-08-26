import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class NetTab extends StatefulWidget {
  const NetTab({super.key});

  @override
  _NetTabState createState() => _NetTabState();
}

class _NetTabState extends State<NetTab> {
  final Graph graph = Graph()..isTree = true;
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();

    Node root = Node.Id('Nhánh 1');
    Node branch2 = Node.Id('Nhánh 2');
    Node branch3 = Node.Id('Nhánh 3');

    Node nguyenHuuKien = Node.Id('Nguyễn Hữu Kiên');
    Node leNguyenKhanh = Node.Id('Lê Nguyên Khánh');

    Node nguyenVanA1 = Node.Id('Nguyễn Văn A 1');
    Node nguyenVanA2 = Node.Id('Nguyễn Văn A 2');
    Node nguyenVanB1 = Node.Id('Nguyễn Văn B 1');
    Node nguyenVanB2 = Node.Id('Nguyễn Văn B 2');
    Node nguyenVanB3 = Node.Id('Nguyễn Văn B 3');
    Node nguyenVanC1 = Node.Id('Nguyễn Văn C 1');
    Node nguyenVanC2 = Node.Id('Nguyễn Văn C 2');
    Node nguyenVanD1 = Node.Id('Nguyễn Văn D 1');
    Node nguyenVanD2 = Node.Id('Nguyễn Văn D 2');
    Node nguyenVanE1 = Node.Id('Nguyễn Văn E 1');
    Node nguyenVanE2 = Node.Id('Nguyễn Văn E 2');
    Node nguyenVanF1 = Node.Id('Nguyễn Văn F 1');
    Node nguyenVanF2 = Node.Id('Nguyễn Văn F 2');

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
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('GraphView Example'),
      // ),
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 5.6,
          child: GraphView(
            graph: graph,
            algorithm:
                BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
            builder: (Node node) {
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
