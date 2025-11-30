import 'dart:io';

import 'package:flutter/material.dart';
import 'package:langyu/routes/home/desktop/desktop_home.dart';
import 'package:langyu/routes/home/mobile_home.dart';

class Home extends StatelessWidget {
  final String sharedText;
  const Home({super.key, required this.sharedText});

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return DesktopHome();
    } else {
      return MobileHome(sharedText: sharedText);
    }
  }
}
