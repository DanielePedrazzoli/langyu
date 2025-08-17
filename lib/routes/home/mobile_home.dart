import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:langyu/routes/results_page/result_page.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
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
}
