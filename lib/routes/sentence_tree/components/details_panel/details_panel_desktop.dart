import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_affixes.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_head.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_image.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_link.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_notes.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_phonetics.dart';
import 'package:langyu/routes/sentence_tree/components/details_panel/details_panel_verb_cojnugation.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class DetailsPanelDesktop extends StatefulWidget {
  final Function onClose;
  final WordMeaning meaning;
  const DetailsPanelDesktop({super.key, required this.onClose, required this.meaning});

  @override
  State<DetailsPanelDesktop> createState() => _DetailsPanelDesktopState();
}

class _DetailsPanelDesktopState extends State<DetailsPanelDesktop> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(minWidth: 200, maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: () => widget.onClose(), icon: Icon(Icons.close)),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
