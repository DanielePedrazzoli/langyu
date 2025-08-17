import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/components/tree_painter.dart';
import 'package:langyu/routes/sentence_tree/models/tree_layout.dart';
import 'package:langyu/routes/sentence_tree/models/tree_node.dart';

class TreeWidget extends StatelessWidget {
  final List<TreeNode> nodes;
  final TreeOrientation orientation;
  final void Function(TreeNode) onNodeTap;

  const TreeWidget({super.key, required this.nodes, this.orientation = TreeOrientation.vertical, required this.onNodeTap});

  @override
  Widget build(BuildContext context) {
    // Calcola offset per hit detection
    final minX = nodes.map((n) => n.x).reduce((a, b) => a < b ? a : b);
    final minY = nodes.map((n) => n.y).reduce((a, b) => a < b ? a : b);
    final dx = 50 - minX;
    final dy = 50 - minY;

    return GestureDetector(
      onTapDown: (details) {
        final tapPos = details.localPosition;

        for (final node in nodes) {
          final cx = node.y + dy;
          final cy = node.x + dx;
          const halfW = 25.0; // metà larghezza
          const halfH = 25.0; // metà altezza

          final rect = Rect.fromCenter(center: Offset(cx, cy), width: halfW * 2, height: halfH * 2);

          if (rect.contains(tapPos)) {
            onNodeTap(node);
            break;
          }
        }
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: TreePainter(nodes: nodes, context: context),
      ),
    );
  }
}
