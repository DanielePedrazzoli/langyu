import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';
import 'package:langyu/routes/results_page/components/sentence_results.dart';

class ResultPageDesktop extends StatefulWidget {
  final AnalisisResult result;
  const ResultPageDesktop({super.key, required this.result});

  @override
  State<ResultPageDesktop> createState() => _ResultPageDesktopState();
}

class _ResultPageDesktopState extends State<ResultPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,

            leading: Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                label: Text("Back to home"),
              ),
            ),
            destinations: [
              NavigationRailDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: Text('First')),
              NavigationRailDestination(
                icon: Badge(child: Icon(Icons.bookmark_border)),
                selectedIcon: Badge(child: Icon(Icons.book)),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Badge(label: Text('4'), child: Icon(Icons.star_border)),
                selectedIcon: Badge(label: Text('4'), child: Icon(Icons.star)),
                label: Text('Third'),
              ),
            ],
            selectedIndex: 0,
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Na'vi input", style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(widget.result.input, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text("English output", style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
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
          ),
        ],
      ),
    );
  }
}
