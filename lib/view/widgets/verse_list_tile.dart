import 'package:flutter/material.dart';
import 'package:quran/core/components/app_packages.dart';

class VerseListTile extends StatelessWidget {
  final Verse verse;
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
              style: TextStyle(
                fontSize: 32.sp,
                fontFamily: 'Al-Qalam',
                wordSpacing: 12.sp,
                height: 1
              ),
            ),
          ),
          
          Text(verse.meaning!),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
