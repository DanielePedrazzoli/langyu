import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class TreeNode {
  String id;
  List<TreeNode> children;
  WordNode? node;
  double x = 0;
  double y = 0;

  TreeNode(this.id, [this.children = const [], this.node]);

  static TreeNode fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    List<TreeNode> children = [];

    if (json.containsKey('children')) {
      var kids = json['children'] as List;
      children = kids.map<TreeNode>((childJson) => fromJson(childJson)).toList();
    }

    return TreeNode(name, children);
  }

  static TreeNode fromPhrase(SegmentTree phrase) {
    List<TreeNode> children = [];
    children = phrase.nodes.map<TreeNode>((node) => _fromWordNode(node)).toList();
    return TreeNode("root", children);
  }

  static TreeNode _fromWordNode(WordNode node) {
    List<TreeNode> children = [];
    children = node.children.map<TreeNode>((node) => _fromWordNode(node)).toList();
    return TreeNode(node.meaning.root, children, node);
  }
}
