import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:langyu/routes/home/desktop/desktop_home.dart';
import 'package:langyu/routes/home/home.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';
import 'package:path_provider/path_provider.dart';

Dictionary dictionary = Dictionary();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const platform = MethodChannel('app.channel.shared.data');
  final sharedText = await platform.invokeMethod<String>('getSharedText') ?? "";

  Directory directory = await getApplicationSupportDirectory();
  await dictionary.loadDictionary(directory);

  setDictionary(dictionary);

  runApp(MyApp(sharedText: sharedText));
}

class MyApp extends StatelessWidget {
  final String sharedText;
  const MyApp({super.key, required this.sharedText});

  @override
  Widget build(BuildContext context) {
    var baseTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF242A3A),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: const Color(0xFF242A3A),
        elevation: 0,
        unselectedIconTheme: IconThemeData(color: const Color.fromARGB(255, 159, 163, 165)),
        selectedIconTheme: IconThemeData(color: const Color.fromARGB(255, 63, 176, 252)),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF242A3A),
        brightness: Brightness.dark,
        primary: const Color.fromARGB(255, 36, 164, 214),
        onPrimary: Colors.white,
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

    if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return fluent_ui.FluentApp(
        home: DesktopHome(),
        theme: fluent_ui.FluentThemeData(brightness: Brightness.dark),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: baseTheme.copyWith(textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme)),
        home: Home(sharedText: sharedText),
      );
    }
  }
}
