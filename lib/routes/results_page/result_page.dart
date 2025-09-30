import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:langyu/routes/results_page/components/sentence_results.dart';

class ResultPage extends StatefulWidget {
  final AnalisisResult result;
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Analisis Result", style: Theme.of(context).textTheme.headlineMedium),
          bottom: TabBar(
            tabs: [
              Tab(text: "Output"),
              Tab(text: "Sentences (${widget.result.translationsResults.length})"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(text: widget.result.input),
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(text: widget.result.output),
                      maxLines: null,
                      readOnly: true,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                    ),
                  ),
                ],
              ),
            ),

            // ListView(
            //   padding: const EdgeInsets.all(8),
            //   children: widget.result.parserResult.map((w) => ParserResult(word: w)).toList(),
            // ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: widget.result.translationsResults.map((TranslationPhrase p) => SentenceResults(translationPhrase: p)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
