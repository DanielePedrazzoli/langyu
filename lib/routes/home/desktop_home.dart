import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:langyu/routes/results_page/result_page.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  TextEditingController controller = TextEditingController();

  bool analizing = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(child: Text("Langyu", style: Theme.of(context).textTheme.headlineLarge)),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff1e2a3a)),
                boxShadow: const [
                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.35), blurRadius: 24, offset: Offset(0, 6)),
                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 6, offset: Offset(0, 2)),
                ],
                borderRadius: BorderRadius.circular(24),
                color: Color(0xff0b0f14),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Enter Na'vi text", style: Theme.of(context).textTheme.headlineSmall),
                      Spacer(),
                      SegmentedButton(
                        onSelectionChanged: (_) {},
                        segments: [
                          ButtonSegment(value: 0, label: Text("Simple search")),
                          ButtonSegment(value: 1, label: Text("Text analysis")),
                        ],
                        showSelectedIcon: false,
                        selected: {0},
                      ),
                    ],
                  ),

                  SizedBox(height: 32),
                  TextField(
                    minLines: 6,
                    maxLines: 16,
                    readOnly: analizing,
                    controller: controller,
                    onSubmitted: onSubmit,
                    decoration: InputDecoration(suffixIcon: SizedBox.shrink(), hintText: 'Enter a sentence to analize ...', alignLabelWithHint: true),
                  ),

                  SizedBox(height: 32),
                  Row(
                    children: [
                      Spacer(),
                      FilledButton.icon(onPressed: () {}, label: Text("Clear"), icon: Icon(Icons.clear)),

                      SizedBox(width: 8),
                      FilledButton.icon(onPressed: () {}, label: Text("Find"), icon: Icon(Icons.send)),
                    ],
                  ),
                ],
              ),
            ),

            TextButton(onPressed: () {}, child: Text("data")),
          ],
        ),
      ),
    );
  }
}
