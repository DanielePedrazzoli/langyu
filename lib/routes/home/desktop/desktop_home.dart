import 'package:flutter/material.dart' as material;
import 'package:langyu/routes/results_page/pages/desktop/result_page_desktop.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  TextEditingController controller = TextEditingController();

  bool analizing = false;

  void onSubmit() async {
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

    Navigator.push(context, material.MaterialPageRoute(builder: (context) => ResultPageDesktop(result: result)));
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // drawer: Drawer(
    //   //   child: ListView(
    //   //     padding: EdgeInsets.zero,
    //   //     children: <Widget>[
    //   //       DrawerHeader(child: Text("Langyu")),
    //   //       ListTile(
    //   //         title: Text("Dictionary"),
    //   //         onTap: () {
    //   //           Navigator.push(context, MaterialPageRoute(builder: (context) => DictionaryPage()));
    //   //         },
    //   //       ),
    //   //     ],
    //   //   ),
    //   // ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(32.0),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Column(children: [Text("Langyu", style: Theme.of(context).textTheme.headlineLarge)]),
    //         ),
    //         Spacer(),
    //         Expanded(
    //           flex: 2,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               Expanded(
    //                 child: TextField(
    //                   expands: true,
    //                   textAlignVertical: TextAlignVertical.top,
    //                   controller: controller,
    //                   maxLines: null,
    //                   minLines: null,
    //                   decoration: InputDecoration(labelText: "Enter a sentence or a text to analize ...", alignLabelWithHint: true),
    //                 ),
    //               ),
    //               SizedBox(height: 16),
    //               FilledButton.icon(onPressed: () => onSubmit(controller.text), label: Text("Analize"), icon: Icon(Icons.search)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return NavigationView(
      appBar: NavigationAppBar(title: Text("Langyu", style: FluentTheme.of(context).typography.title), automaticallyImplyLeading: false),
      pane: NavigationPane(
        selected: 1,
        items: [
          PaneItem(key: const ValueKey('/'), icon: const WindowsIcon(WindowsIcons.home), title: const Text('Home'), body: const SizedBox.shrink()),
          PaneItem(
            key: const ValueKey('/analize'),
            icon: const WindowsIcon(WindowsIcons.text_edit),
            title: const Text('Analize'),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Analize", style: FluentTheme.of(context).typography.title),
                          SizedBox(height: 8),
                          Text("Input the text in Na'vi in the input below and click the 'Start analisis' button"),
                          Text("The interpreter will run and try to analize and traslate all the sentences in the text"),
                        ],
                      ),
                      Spacer(),
                      FilledButton(
                        child: Text("Start analisis"),
                        onPressed: () {
                          onSubmit();
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  TextFormBox(controller: controller, maxLines: null, minLines: 5),
                ],
              ),
            ),
          ),
          PaneItem(
            key: const ValueKey('/search'),
            icon: const WindowsIcon(WindowsIcons.search),
            title: const Text('Search'),
            body: const SizedBox.shrink(),
          ),
          PaneItem(
            key: const ValueKey('/option'),
            icon: const WindowsIcon(WindowsIcons.settings),
            title: const Text('Option'),
            body: const SizedBox.shrink(),
          ),
        ],
      ),
      paneBodyBuilder: (item, body) => body ?? SizedBox.shrink(),
    );
  }
}
