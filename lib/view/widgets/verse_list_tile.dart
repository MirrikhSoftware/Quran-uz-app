import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';
import 'package:quran/models/verse/verse_model.dart';
import 'package:quran/view/widgets/buttons/app_icon_button.dart';

class VerseListTile extends StatelessWidget {
  final VerseModel verse;
  const VerseListTile({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              verse.arabic!,
              textAlign: TextAlign.start,
              locale: const Locale('ar'),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'Al-Qalam',
                wordSpacing: 12,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            verse.meaning!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppIconButton(
                icon: Icons.share,
                onPressed: () {},
              ),
              SizedBox(width: 12.w),
              AppIconButton(
                icon: Icons.copy,
                onPressed: () {},
              ),
              SizedBox(width: 12.w),
              AppIconButton(
                icon: verse.isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                onPressed: () async {
                   verse.isSaved = !verse.isSaved;
                   await verse.save();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
