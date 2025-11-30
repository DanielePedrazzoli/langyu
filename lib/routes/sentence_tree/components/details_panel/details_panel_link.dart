import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class DetailsPanelLink extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelLink({super.key, required this.meaning});

  @override
  Widget build(BuildContext context) {
    // if (meaning.notes.isEmpty) {
    if (true) {
      return SizedBox.shrink();
    }
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        childrenPadding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        title: Text("Links"),
        children: [Text("Link1"), Text("Link2"), Text("Link3"), Text("Link4")],
      ),
    );
  }
}
