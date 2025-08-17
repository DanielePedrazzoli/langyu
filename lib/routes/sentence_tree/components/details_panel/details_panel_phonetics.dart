import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class DetailsPanelPhonetics extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelPhonetics({super.key, required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text("Phonetics"),
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        childrenPadding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("IPA"),
              Text(
                "[ˈta.ɾon]",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade400),
              ),
            ],
          ),
          SizedBox(height: 16),

          Row(
            spacing: 16,
            children: [
              Expanded(
                child: OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.play_arrow), label: Text("Listen from Plumps")),
              ),
              Expanded(
                child: OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.play_arrow), label: Text("Listen from Tsyìli")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
