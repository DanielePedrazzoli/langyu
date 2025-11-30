import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/models/tree_node.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class TreePainter extends CustomPainter {
  final List<TreeNode> nodes;
  final BuildContext context;

  TreePainter({required this.nodes, required this.context});

  Color getNodeColor(WordNode? node) {
    if (node == null) return Colors.teal.shade400;

    if (node.isANoun) {
      return Colors.grey.shade400;
    }

    if (node.isAVerb) {
      return Colors.red.shade400;
    }

    if (node.isAndAdjective) {
      return Colors.blue.shade400;
    }

    if (node.isAnAdverb) {
      return Colors.purple.shade400;
    }

    return Colors.teal.shade400;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 1.5;

    // Calcola offset per centrare
    final minX = nodes.map((n) => n.x).reduce((a, b) => a < b ? a : b);
    final minY = nodes.map((n) => n.y).reduce((a, b) => a < b ? a : b);

    final dx = 50 - minX;
    final dy = 50 - minY;

    // Disegno linee
    // Disegno curve tra nodi
    for (final node in nodes) {
      for (final child in node.children) {
        final parentOffset = Offset(node.y + dy, node.x + dx);
        final childOffset = Offset(child.y + dy, child.x + dx);

        final path = Path();
        path.moveTo(parentOffset.dx, parentOffset.dy);

        // Curva a S (Bezier cubica)
        final control1 = Offset((parentOffset.dx + childOffset.dx) / 2, parentOffset.dy);
        final control2 = Offset((parentOffset.dx + childOffset.dx) / 2, childOffset.dy);

        path.cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, childOffset.dx, childOffset.dy);

        canvas.drawPath(path, paintLine);
      }
    }

    // Disegno nodi
    for (final node in nodes) {
      final cx = node.y + dy;
      final cy = node.x + dx;

      RRect fullRect = RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(cx, cy), width: 75, height: 35), Radius.circular(8));

      final backgroundPanit = Paint()
        ..color = Theme.of(context).scaffoldBackgroundColor
        ..style = PaintingStyle.fill;

      Color color = getNodeColor(node.node);

      final fillPaint = Paint()
        ..color = color.withAlpha(25)
        ..style = PaintingStyle.fill;

      final strokePaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke;

      canvas.drawRRect(fullRect, backgroundPanit);
      canvas.drawRRect(fullRect, fillPaint);
      canvas.drawRRect(fullRect, strokePaint);

      final textSpan = TextSpan(
        text: node.id,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      );
      final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(cx - tp.width / 2, cy - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
