import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_structure/sentence_structure.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class SentenceResults extends StatelessWidget {
  final TranslationPhrase translationPhrase;
  const SentenceResults({super.key, required this.translationPhrase});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(translationPhrase.phrase.rawText, style: Theme.of(context).textTheme.titleLarge),
            Text(
              translationPhrase.getPhraseTranslation().first,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey.shade400, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: () {
                    //s  Navigator.push(context, MaterialPageRoute(builder: (context) => SentenceStructure(sentence: sentence)));
                  },
                  child: Text("Show structure"),
                ),
                SizedBox(height: 8),
                OutlinedButton(onPressed: () {}, child: Text("Show other transaltion (2)")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
