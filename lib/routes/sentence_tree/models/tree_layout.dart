import 'package:langyu/routes/sentence_tree/models/tree_node.dart';

class TreeLayout {
  double nodeWidth;
  double nodeHeight;
  double horizontalGap;
  double verticalGap;
  TreeOrientation orientation;

  double _currentX = 0;

  TreeLayout({
    this.nodeWidth = 50,
    this.nodeHeight = 50,
    this.horizontalGap = 20,
    this.verticalGap = 70,
    this.orientation = TreeOrientation.vertical,
  });

  void layout(TreeNode root) {
    _currentX = 0;
    _layoutNode(root, 0);

    // Se orizzontale, scambia assi
    if (orientation == TreeOrientation.horizontal) {
      _swapAxes(root);
    }
  }

  void _layoutNode(TreeNode node, int depth) {
    node.y = depth * (nodeHeight + verticalGap);

    if (node.children.isEmpty) {
      node.x = _currentX;
      _currentX += nodeWidth + horizontalGap;
    } else {
      for (var child in node.children) {
        _layoutNode(child, depth + 1);
      }
      double firstChildX = node.children.first.x;
      double lastChildX = node.children.last.x;
      node.x = (firstChildX + lastChildX) / 2;
    }
  }

  void _swapAxes(TreeNode node) {
    // scambia x e y
    final temp = node.x;
    node.x = node.y;
    node.y = temp;

    for (var child in node.children) {
      _swapAxes(child);
    }
  }
}

enum TreeOrientation { vertical, horizontal }
