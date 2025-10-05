import 'package:flutter/material.dart';
import 'package:langyu/main.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dictionary")),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          Card(
            child: ListTile(title: Text("Dicionary version"), subtitle: Text(dictionary.version.toString())),
          ),
          Card(
            child: ListTile(title: Text("Date of update"), subtitle: Text(dictionary.version.date)),
          ),
          Card(
            child: ListTile(title: Text("Number of entry"), subtitle: Text(dictionary.numberOfEntries.toString())),
          ),
        ],
      ),
    );
  }
}
