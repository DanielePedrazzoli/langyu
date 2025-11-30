import 'package:flutter/material.dart';
import 'package:langyu/routes/results_page/pages/phrases_log.dart';
import 'package:langyu/routes/sentence_structure/sentence_structure.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class SentenceResults extends StatefulWidget {
  final Sentence sentence;
  const SentenceResults({super.key, required this.sentence});

  @override
  State<SentenceResults> createState() => _SentenceResultsState();
}

class _SentenceResultsState extends State<SentenceResults> {
  int _selectedSegmentTree = 0;

  Future<void> _changeTraslation() async {}
  Future<void> _showLogs() async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => PhrasesLog(phrases: widget.sentence.segments)));
  }

  Future<void> _inspectStructure() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SentenceStructure(sentence: widget.sentence)));
  }

  @override
  Widget build(BuildContext context) {
    int numberOfPhrases = widget.sentence.traslationPhrases.length;

    String traslationOfCurrent = "";
    if (_selectedSegmentTree < numberOfPhrases) {
      //traslationOfCurrent = widget.sentence.traslationPhrases[_selectedPhrase].getPhraseTranslation().firstOrNull ?? "";
    }
    return Card.outlined(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.sentence.raw, style: Theme.of(context).textTheme.titleLarge),
            Text(
              traslationOfCurrent,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey.shade400, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(onPressed: _inspectStructure, child: Text("Show structure")),
                SizedBox(height: 8),
                if (numberOfPhrases > 1) OutlinedButton(onPressed: _changeTraslation, child: Text("Show other phrases ($numberOfPhrases)")),
                OutlinedButton(onPressed: _showLogs, child: Text("Show phrases log")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
