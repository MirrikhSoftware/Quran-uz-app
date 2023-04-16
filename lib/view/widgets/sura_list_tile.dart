import 'package:flutter/material.dart';
import 'package:quran/bloc/sura/sura_bloc.dart';
import 'package:quran/core/core.dart';
import 'package:quran/core/theme/app_fonts.dart';
import 'package:quran/routes/routes.dart';
import 'package:quran/view/screens/screens.dart';
import 'package:quran/view/widgets/star_widget.dart';

class SuraListTile extends StatelessWidget {
  final Sura surah;

  const SuraListTile({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        SuraBloc suraBloc = SuraBloc();
        suraBloc.add(SuraSelectedEvent(surah));
        AppNavigator.push(BlocProvider(
          create: (_) => suraBloc,
          child: const SuraScreen(),
        ));
      },
      leading: StarWidget(content: surah.id.toString()),
      title: Text(surah.nameUz),
      subtitle: Text('${surah.versesCount} оят'),
      trailing: Text(
        surah.nameAr,
        style: const TextStyle(
          fontFamily: AppFonts.meQuran,
          color: AppColors.indigo,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
