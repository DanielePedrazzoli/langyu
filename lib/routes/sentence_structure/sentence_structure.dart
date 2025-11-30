import 'package:flutter/material.dart';
import 'package:langyu/routes/sentence_tree/sentence_tree.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class SentenceStructure extends StatefulWidget {
  final Sentence sentence;
  const SentenceStructure({super.key, required this.sentence});

  @override
  State<SentenceStructure> createState() => _SentenceStructureState();
}

class _SentenceStructureState extends State<SentenceStructure> {
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
              Tab(text: "Words"),
              Tab(text: "Tree"),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView(
              padding: const EdgeInsets.all(8),
              children: (widget.sentence.traslationPhrases.firstOrNull?.phrase.nodes ?? List<WordNode>.empty())
                  .map(
                    (n) => Card(
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text(n.meaning.root, style: Theme.of(context).textTheme.titleLarge),
                        subtitle: Text("meaning translation"),
                        trailing: Text(n.meaning.type.name),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(child: Container(width: MediaQuery.of(context).size.width * 0.5)),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            SentenceTreePage(phrase: widget.sentence.traslationPhrases.first.phrase),
          ],
        ),
      ),
    );
  }
}
