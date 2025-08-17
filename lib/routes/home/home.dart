import 'dart:io';

import 'package:flutter/material.dart';
import 'package:langyu/routes/home/desktop_home.dart';
import 'package:langyu/routes/home/mobile_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return DesktopHome();
    } else {
      return MobileHome();
    }
  }
}
