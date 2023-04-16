import 'package:flutter/material.dart';
import 'package:quran/core/components/app_formatter.dart';
import 'package:quran/core/theme/app_fonts.dart';
import 'package:quran/view/widgets/buttons/rounded_icon_button.dart';
import 'package:quran/view/widgets/highlighted_text_widget.dart';
import 'package:quran_uz/quran_uz.dart';
import 'package:share_plus/share_plus.dart';

class VerseListTile extends StatelessWidget {
  final Verse verse;
  final String query;
  const VerseListTile({
    Key? key,
    required this.verse,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppFormatter formatter = AppFormatter();
    String number = formatter.numberFormat(verse.verseId);
    String formatted = '\uFD3F$number\uFD3E';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${verse.arabic.replaceFirst('\n', '')} $formatted',
              textAlign: TextAlign.start,
              locale: const Locale('ar'),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: AppFonts.meQuran,
                wordSpacing: 12,
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          HighlightTextWidget(
            source: '${verse.verseId}. ${verse.meaning}',
            query: query,
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SHARE
              RoundedIconButton(
                icon: Icons.share,
                onPressed: _onShare,
              ),

              const SizedBox(width: 12.0),
            ],
          )
        ],
      ),
    );
  }

  // Future<void> _onCopyPressed() async {
  //   AppFormatter formatter = AppFormatter();
  //   String clipboardText = formatter.formatClipboard(verse);
  //   await Clipboard.setData(ClipboardData(text: clipboardText));
  // }

  Future<void> _onShare() async {
    AppFormatter formatter = AppFormatter();
    String clipboardText = formatter.formatClipboard(verse);
    Share.share(clipboardText);

    // var data = await Clipboard.getData(Clipboard.kTextPlain);
    // print(data?.text);
  }
}
