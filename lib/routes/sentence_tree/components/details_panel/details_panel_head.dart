import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class DetailsPanelHead extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelHead({super.key, required this.meaning});

  Widget _getLoan(BuildContext context) {
    if (meaning.isLoan == false) return SizedBox.shrink();

    String loanWordDescription = "  ";

    return Tooltip(
      message: loanWordDescription,
      child: Text("loan word", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.redAccent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(meaning.root, style: Theme.of(context).textTheme.headlineLarge)),
            _getLoan(context),
          ],
        ),
        SizedBox(height: 8),
        Text("House", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
