import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class DetailsPanelVerbCojnugation extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelVerbCojnugation({super.key, required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text("Verb conjugation"),
        childrenPadding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("t..ar.on", style: Theme.of(context).textTheme.bodyLarge),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ],
          ),
        ],
      ),
    );
  }
}
