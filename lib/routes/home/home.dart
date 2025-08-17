import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:langyu/routes/results_page/result_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  bool analizing = false;

  @override
  void initState() {
    super.initState();
  }

  void onSubmit(String? string) async {
    print(controller.text);
    analizing = true;
    setState(() {});

    AnalisisResult result;
    try {
      result = await analizeNavi(controller.text);
    } catch (e) {
      print(e);
      analizing = false;
      setState(() {});
      return;
    }
    analizing = false;
    setState(() {});

    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(result: result)));
  }

  Widget _buildMobileScaffold() {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Analizer"),
                  TextButton(onPressed: () {}, child: Text("data")),
                ],
              ),
            ),

            Stack(
              children: [
                TextField(
                  minLines: 1,
                  maxLines: 7,
                  readOnly: analizing,
                  textAlignVertical: TextAlignVertical.top,
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: SizedBox.shrink(),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                    labelText: 'Enter a sentence to analize ...',
                  ),
                ),

                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    alignment: Alignment.bottomCenter,
                    width: 36,
                    height: 36,
                    child: analizing
                        ? SpinKitThreeBounce(color: Colors.white, size: 16)
                        : Container(
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(32)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                onSubmit(controller.text);
                              },
                              icon: const Icon(Icons.search, color: Colors.black),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopScaffold() {
    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),

      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Na'vi sentence analizer", style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 64),
                Stack(
                  children: [
                    TextField(
                      minLines: 1,
                      maxLines: 7,
                      readOnly: analizing,
                      textAlignVertical: TextAlignVertical.top,
                      controller: controller,
                      decoration: InputDecoration(
                        suffixIcon: SizedBox.shrink(),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                        labelText: 'Enter a sentence to analize ...',
                      ),
                    ),

                    Positioned(
                      right: 6,
                      bottom: 6,
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        alignment: Alignment.bottomCenter,
                        width: 36,
                        height: 36,
                        child: analizing
                            ? SpinKitThreeBounce(color: Colors.white, size: 16)
                            : Container(
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(32)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    onSubmit(controller.text);
                                  },
                                  icon: const Icon(Icons.search, color: Colors.black),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 34,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text("What is this")),
                      OutlinedButton(onPressed: () {}, child: Text("How to use")),
                      OutlinedButton(onPressed: () {}, child: Text("What can do")),
                      OutlinedButton(onPressed: () {}, child: Text("How it work")),
                      OutlinedButton(onPressed: () {}, child: Text("Give me an example")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return _buildDesktopScaffold();
    } else {
      return _buildMobileScaffold();
    }
  }
}
