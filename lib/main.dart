import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:langyu/routes/home/home.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:path_provider/path_provider.dart';

Dictionary dictionary = Dictionary();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationSupportDirectory();
  await dictionary.loadDictionary(directory);

  setDictionary(dictionary);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var baseTheme = ThemeData(
    //   useMaterial3: true,
    //   // scaffoldBackgroundColor: Color(0xFF27282A),
    //   appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
    //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, brightness: brightness, primary: Colors.white),
    //   inputDecorationTheme: InputDecorationTheme(
    //     fillColor: Color(0xFF0f151f),
    //     filled: true,
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       borderSide: BorderSide(color: Color(0xff1e2a3a)),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       borderSide: BorderSide(color: Color(0xff1e2a3a)),
    //     ),
    //     floatingLabelBehavior: FloatingLabelBehavior.never,
    //   ),
    //   expansionTileTheme: ExpansionTileThemeData(shape: RoundedRectangleBorder()),
    //   chipTheme: ChipThemeData(
    //     backgroundColor: Color(0xFF27282A),
    //     surfaceTintColor: Colors.transparent,
    //     elevation: 0,
    //     side: BorderSide(width: 1, color: const Color.fromARGB(78, 255, 255, 255)),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //   ),
    // );

    var baseTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF242A3A),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF242A3A),
        brightness: Brightness.dark,
        primary: const Color.fromARGB(255, 56, 255, 255),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color(0xFF303747),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff424858)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xff424858)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),

      cardTheme: CardThemeData(
        color: Color(0xFF303747),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(0xff424858)),
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme)),
      home: Home(),
    );
  }
}
