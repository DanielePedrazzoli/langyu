import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';
import 'package:langyu/routes/results_page/components/sentence_results.dart';

class ResultPageMobile extends StatefulWidget {
  final AnalisisResult result;
  const ResultPageMobile({super.key, required this.result});

  @override
  State<ResultPageMobile> createState() => _ResultPageMobileState();
}

class _ResultPageMobileState extends State<ResultPageMobile> {
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
              Tab(text: "Sentences (${widget.result.sentences.length})"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(widget.result.input, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(widget.result.output, style: Theme.of(context).textTheme.bodyLarge),
                      ),
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
              children: widget.result.sentences.map((Sentence s) => SentenceResults(sentence: s)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
