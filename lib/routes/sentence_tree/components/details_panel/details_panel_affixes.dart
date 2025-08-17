import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer.dart';

class DetailsPanelAffixes extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelAffixes({super.key, required this.meaning});

  Widget _getPrefix(BuildContext context) {
    Widget child = Text(
      "no prefix found",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
    );

    if (meaning.prefix != null) {
      String sign = meaning.prefix!.causeLenition ? "+" : "-";
      child = Tooltip(
        message: "prefix description",
        child: Chip(label: Text(meaning.prefix!.value + sign, style: Theme.of(context).textTheme.bodyLarge)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text("Prefix", style: Theme.of(context).textTheme.bodyLarge),
        Row(children: [child]),
      ],
    );
  }

  Widget _getSuffix(BuildContext context) {
    Widget child = Text(
      "no suffix found",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
    );

    if (meaning.suffix != null) {
      child = Tooltip(
        message: "suffix description",
        child: Chip(label: Text(meaning.suffix!.value, style: Theme.of(context).textTheme.bodyLarge)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text("Suffix", style: Theme.of(context).textTheme.bodyLarge),
        Row(children: [child]),
      ],
    );
  }

  Widget _getInfixes(BuildContext context) {
    Widget child = Text(
      "no infixes found",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
    );

    if (meaning.infixes.isNotEmpty) {
      Infix? pre = meaning.infixes.firstWhereOrNull((infix) => infix.position == InfixPosition.pre);
      Infix? first = meaning.infixes.firstWhereOrNull((infix) => infix.position == InfixPosition.first);
      Infix? second = meaning.infixes.firstWhereOrNull((infix) => infix.position == InfixPosition.second);

      List<Widget> widgets = [];

      if (pre != null) {
        widgets.add(
          Tooltip(
            message: "infix - pre position",
            child: Chip(label: Text("<${pre.value}>", style: Theme.of(context).textTheme.bodyLarge)),
          ),
        );
      }

      if (first != null) {
        widgets.add(
          Tooltip(
            message: "infix first position",
            child: Chip(label: Text("<${first.value}>", style: Theme.of(context).textTheme.bodyLarge)),
          ),
        );
      }

      if (second != null) {
        widgets.add(
          Tooltip(
            message: "infix second position",
            child: Chip(label: Text("<${second.value}>", style: Theme.of(context).textTheme.bodyLarge)),
          ),
        );
      }

      child = Row(spacing: 8, children: widgets);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text("Infixes", style: Theme.of(context).textTheme.bodyLarge),
        child,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
        title: Text("Affixes"),
        children: [
          // Tooltip(
          //   message: "prefix descrition",
          //   child: Chip(label: Text("fì-", style: Theme.of(context).textTheme.bodyLarge)),
          // ),
          _getPrefix(context),
          SizedBox(height: 24),
          _getInfixes(context),
          SizedBox(height: 24),
          _getSuffix(context),
        ],
      ),
    );
  }
}
