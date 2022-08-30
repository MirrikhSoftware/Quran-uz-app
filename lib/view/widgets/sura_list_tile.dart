import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/core.dart';
import 'package:quran/core/theme/app_fonts.dart';
import 'package:quran/routes/routes.dart';

class SuraListTile extends StatelessWidget {
  final Sura surah;

  const SuraListTile({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        SuraBloc suraBloc = BlocProvider.of(context);
        suraBloc.add(SuraSelectedEvent(surah));
        AppNavigator.pushNamed(RouteNames.sura_details);
      },
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppIcons.hexagon, color: AppColors.indigo),
          Text(surah.id.toString())
        ],
      ),
      title: Text(
        surah.nameUz!,
      ),
      subtitle: Text('${surah.versesCount} оят'),
      trailing: Text(surah.nameAr!,style: TextStyle(
        fontFamily: AppFonts.meQuran,
        color: AppColors.indigo,
        fontSize: 20.sp
      ),),
    );
  }
}
