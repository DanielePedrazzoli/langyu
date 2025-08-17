import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:langyu/routes/results_page/components/interpreter_result.dart';
import 'package:langyu/routes/results_page/components/parser_result.dart';

class ResultPage extends StatefulWidget {
  final AnalisisResult result;
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    Word word = Word();
    word.word = "test";

    WordMeaning meaning = WordMeaning();
    meaning.dictKey = "oe:pn";

    word.meanings.add(meaning);
    // return const Placeholder();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resuls"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Parser"),
              Tab(text: "Interpreter (${widget.result.interpreterResult.length})"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(8),
              children: widget.result.parserResult.map((w) => ParserResult(word: w)).toList(),
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: widget.result.interpreterResult.map((list) => InterpreterResult(phrase: list)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
