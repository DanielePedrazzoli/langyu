import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:langyu/routes/home/home.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dictionary dictionary = Dictionary();
  Directory directory = await getApplicationSupportDirectory();
  await dictionary.loadDictionary("${directory.path}/dictionary.json");

  setDictionary(dictionary);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Brightness.dark;

    var baseTheme = ThemeData(
      useMaterial3: true,
      // scaffoldBackgroundColor: Color(0xFF27282A),
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, brightness: brightness, primary: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xFF424242),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      expansionTileTheme: ExpansionTileThemeData(shape: RoundedRectangleBorder()),
      chipTheme: ChipThemeData(
        backgroundColor: Color(0xFF27282A),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        side: BorderSide(width: 1, color: const Color.fromARGB(78, 255, 255, 255)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: baseTheme.copyWith(textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme)),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }
}
