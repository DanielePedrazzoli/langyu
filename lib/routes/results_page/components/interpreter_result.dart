import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/sentence_tree.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class InterpreterResult extends StatelessWidget {
  final Phrase phrase;
  const InterpreterResult({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("transaltion of the phrase", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SentenceTreePage(phrase: phrase)));
                  },
                  child: Text("Show tree"),
                ),
                SizedBox(height: 8),
                OutlinedButton(onPressed: () {}, child: Text("Show other transaltion ({x})")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
