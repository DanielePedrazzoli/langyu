import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class PhrasesLog extends StatefulWidget {
  final List<SegmentTree> phrases;
  const PhrasesLog({super.key, required this.phrases});

  @override
  State<PhrasesLog> createState() => _PhrasesLogState();
}

class _PhrasesLogState extends State<PhrasesLog> {
  bool _hideValid = false;

  Widget generateLogWidget(BuildContext context, SegmentTree phrase) {
    final spans = _parseAnsiToTextSpans(
      phrase
          .toString()
          .replaceAll("WordType.", "")
          .replaceAll("root:", "")
          .replaceAll("Phrase:", "")
          .replaceAll("valid: true\n", "")
          .replaceAll("valid: false\n", ""),
    );
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
        children: [
          TextSpan(
            text: "${phrase.rawText}\n",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),

          ...spans,

          if (phrase.isValid == false) TextSpan(text: "\n\nLOG:\n"),
          // if (phrase.isValid == false) ...phrase.phraseLog.map((log) => TextSpan(text: "- $log\n")),
        ],
      ),
    );
  }

  List<TextSpan> _parseAnsiToTextSpans(String input) {
    final regex = RegExp(r'\x1B\[(\d+;?\d*)m');
    final spans = <TextSpan>[];

    TextStyle currentStyle = const TextStyle(color: Colors.white);
    int lastMatchEnd = 0;

    for (final match in regex.allMatches(input)) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: input.substring(lastMatchEnd, match.start), style: currentStyle));
      }

      final code = match.group(1);
      currentStyle = _ansiToTextStyle(code, currentStyle);
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < input.length) {
      spans.add(TextSpan(text: input.substring(lastMatchEnd), style: currentStyle));
    }

    return spans;
  }

  TextStyle _ansiToTextStyle(String? code, TextStyle current) {
    switch (code) {
      case '0':
        return const TextStyle(color: Colors.white);
      case '32':
        return const TextStyle(color: Colors.green);
      case '33':
        return const TextStyle(color: Colors.yellow);
      default:
        return current;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<SegmentTree> phrases = widget.phrases.where((phrase) => !_hideValid || !phrase.isValid).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phrases log"),
        actions: [
          Switch(
            value: _hideValid,
            onChanged: (bool newState) {
              setState(() => _hideValid = newState);
            },
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: phrases.length,
        itemBuilder: (context, index) => ExpansionTile(
          leading: Icon(phrases[index].isValid ? Icons.check : Icons.close, color: phrases[index].isValid ? Colors.green : Colors.red),
          title: Text(phrases[index].rawText),
          children: [
            SingleChildScrollView(padding: EdgeInsets.all(4), scrollDirection: Axis.horizontal, child: generateLogWidget(context, phrases[index])),
          ],
        ),
      ),
    );
  }
}
