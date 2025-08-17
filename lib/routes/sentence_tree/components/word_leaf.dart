import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';
import 'package:collection/collection.dart';

class WordLeaf extends StatelessWidget {
  final WordMeaning meaning;
  final double x;
  final double y;
  const WordLeaf({super.key, required this.meaning, required this.x, required this.y});

  List<Widget> _buildInfixesRow() {
    Infix? pre = meaning.infixes.singleWhereOrNull((infix) => infix.position == InfixPosition.pre);
    Infix? first = meaning.infixes.singleWhereOrNull((infix) => infix.position == InfixPosition.first);
    Infix? second = meaning.infixes.singleWhereOrNull((infix) => infix.position == InfixPosition.second);

    List<Widget> widgets = [];

    if (pre != null) widgets.add(Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Infix - pre"), Text(pre.value)]));
    if (first != null) widgets.add(Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Infix - first"), Text(first.value)]));
    if (second != null) widgets.add(Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Infix - second"), Text(second.value)]));

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Card.outlined(
        child: Container(
          constraints: BoxConstraints(minWidth: 100, minHeight: 30, maxWidth: 200),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("${meaning.root} (${meaning.type.name})")]),
              if (meaning.prefix != null)
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Prefix"), Text(meaning.prefix!.value)]),
              if (meaning.suffix != null)
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Suffix"), Text(meaning.suffix!.value)]),
              if (meaning.infixes.isNotEmpty) ..._buildInfixesRow(),
            ],
          ),
        ),
      ),
    );
  }
}
