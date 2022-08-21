import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';

class VerseListTile extends StatelessWidget {
  final Verse verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          verse.arabic!,
          locale: const Locale('ar'),
          textDirection: TextDirection.rtl,
        ),

        Text(verse.meaning!),
      ],
    );
  }
}
