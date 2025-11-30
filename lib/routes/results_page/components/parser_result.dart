import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_mobile.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class ParserResult extends StatelessWidget {
  final Word word;
  const ParserResult({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("${word.word} (${word.meanings.length})", style: Theme.of(context).textTheme.titleLarge),
      childrenPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      tilePadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),

      children: word.meanings.map((m) => MeaningDisplay(meaning: m)).toList(),
    );
  }
}

class MeaningDisplay extends StatelessWidget {
  final WordMeaning meaning;
  const MeaningDisplay({super.key, required this.meaning});

  String _buildInfix() {
    int vowelCount = getLastVowelIndex(meaning.root);
    String template = meaning.root;
    if (vowelCount >= 2) {
      int lastVowelIndex = getLastVowelIndex(meaning.root);
      int secondToLastVowelIndex = getSecondToLastVowelIndex(meaning.root);

      String preInfixPart = meaning.root.substring(0, lastVowelIndex);
      String postInfixPart = meaning.root.substring(lastVowelIndex);
      template = "$preInfixPart{0}{1}${meaning.root.substring(lastVowelIndex, secondToLastVowelIndex)}{2}$postInfixPart";
    } else {
      int lastVowelIndex = getLastVowelIndex(meaning.root);

      template = "${meaning.root.substring(0, lastVowelIndex)}{0}{1}{2}${meaning.root.substring(lastVowelIndex)}";
    }

    for (Infix infix in meaning.infixes) {
      switch (infix.position) {
        case InfixPosition.pre:
          template = template.replaceFirst("{0}", "<${infix.value}>");
          break;
        case InfixPosition.first:
          template = template.replaceFirst("{1}", "<${infix.value}>");
          break;
        case InfixPosition.second:
          template = template.replaceFirst("{2}", "<${infix.value}>");
          break;
      }
    }

    template = template.replaceFirst("{0}", "");
    template = template.replaceFirst("{1}", "");
    template = template.replaceFirst("{2}", "");

    return template;
  }

  String _buildText() {
    String template = "{prefix} {root} {suffix}";

    if (meaning.prefix != null) {
      template = template.replaceFirst("{prefix}", "${meaning.prefix!.value}- + ");
    } else {
      template = template.replaceAll("{prefix}", "");
    }

    if (meaning.suffix != null) {
      template = template.replaceFirst("{suffix}", "+ -${meaning.suffix!.value}");
    } else {
      template = template.replaceAll("{suffix}", "");
    }

    if (meaning.infixes.isNotEmpty) {
      template = template.replaceFirst("{root}", _buildInfix());
    } else {
      template = template.replaceAll("{root}", meaning.root);
    }

    return template.trim();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      title: Text(meaning.root, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(_buildText(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
      trailing: Chip(label: Text(meaning.type.name, style: Theme.of(context).textTheme.bodyMedium)),
      onTap: () {
        showDialog(
          context: context,

          builder: (context) => Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: DetailsPanelMobile(onClose: () {}, meaning: meaning),
            ),
          ),
        );
      },
    );
  }
}
