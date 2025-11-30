import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_affixes.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_head.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_image.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_link.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_notes.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_phonetics.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_verb_cojnugation.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class DetailsPanelMobile extends StatefulWidget {
  final Function onClose;
  final WordMeaning meaning;
  const DetailsPanelMobile({super.key, required this.onClose, required this.meaning});

  @override
  State<DetailsPanelMobile> createState() => _DetailsPanelDesktopState();
}

class _DetailsPanelDesktopState extends State<DetailsPanelMobile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        DetailsPanelHead(meaning: widget.meaning),
        SizedBox(height: 24),
        DetailsPanelImage(meaning: widget.meaning),
        DetailsPanelAffixes(meaning: widget.meaning),
        DetailsPanelVerbCojnugation(meaning: widget.meaning),
        DetailsPanelPhonetics(meaning: widget.meaning),
        DetailsPanelNotes(meaning: widget.meaning),
        DetailsPanelLink(meaning: widget.meaning),
      ],
    );
  }
}
