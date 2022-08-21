import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';

class SuraListTile extends StatelessWidget {
  final Sura surah;

  const SuraListTile({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppIcons.hexagon, color: AppColors.primary),
          Text(surah.id.toString())
        ],
      ),
      title: Text(
        surah.nameUz!,
      ),
      subtitle: Text('MACCA ${surah.versesCount} OYAT'),
      trailing: Text(
        surah.nameAr!,
      ),
    );
  }
}
