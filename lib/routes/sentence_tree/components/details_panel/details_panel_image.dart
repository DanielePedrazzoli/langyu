import 'package:flutter/material.dart';
import 'package:navi_text_analizer_package/navi_text_analizer_package.dart';

class DetailsPanelImage extends StatelessWidget {
  final WordMeaning meaning;
  const DetailsPanelImage({super.key, required this.meaning});

  @override
  Widget build(BuildContext context) {
    // if (meaning.image == null) {
    if (true) {
      return SizedBox.shrink();
    }

    // return Container(margin: EdgeInsets.symmetric(vertical: 32), child: Image.network(meaning.image!));
  }
}
