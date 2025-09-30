import 'dart:io';

import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_desktop.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_mobile.dart';
import 'package:langyu/routes/sentence_tree/components/tree_widget.dart';
import 'package:langyu/routes/sentence_tree/models/tree_layout.dart';
import 'package:langyu/routes/sentence_tree/models/tree_node.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class SentenceTreePage extends StatefulWidget {
  final Phrase phrase;
  const SentenceTreePage({super.key, required this.phrase});
  @override
  State<SentenceTreePage> createState() => _SentenceTreePageState();
}

class _SentenceTreePageState extends State<SentenceTreePage> {
  late final TreeNode treeRoot;
  final List<TreeNode> treeNodes = <TreeNode>[];
  WordNode? selectedNode;
  bool showDetails = false;

  @override
  void initState() {
    super.initState();

    treeRoot = TreeNode.fromPhrase(widget.phrase);

    var treeLayout = TreeLayout(nodeHeight: 180, horizontalGap: 0, verticalGap: 0, nodeWidth: 60, orientation: TreeOrientation.vertical);
    treeLayout.layout(treeRoot);

    treeNodes.clear();
    void collect(TreeNode n) {
      treeNodes.add(n);
      for (final c in n.children) {
        collect(c);
      }
    }

    collect(treeRoot);
  }

  void _hideDetails() {
    setState(() {
      showDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InteractiveViewer(
            maxScale: 100,
            minScale: 0.01,
            panEnabled: true,
            child: Stack(
              children: [
                Positioned.fill(
                  child: TreeWidget(
                    nodes: treeNodes,
                    onNodeTap: (treeNode) async {
                      print(treeNode.node?.meaning.root);
                      selectedNode = treeNode.node;
                      showDetails = true;
                      setState(() {});

                      if (selectedNode != null && Platform.isAndroid) {
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return DetailsPanelMobile(onClose: _hideDetails, meaning: selectedNode!.meaning);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        if (Platform.isWindows && showDetails && selectedNode != null) DetailsPanelDesktop(onClose: _hideDetails, meaning: selectedNode!.meaning),
      ],
    );
  }
}
