/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 15:12:37
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/routes/routes.dart';
import 'package:quran/view/screens/sura/juz_screen.dart';
import 'package:quran/view/widgets/star_widget.dart';

class JuzListWidget extends StatelessWidget {
  final List<JuzModel> juzList;

  const JuzListWidget({super.key, required this.juzList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: juzList.length,
      separatorBuilder: (context, index) => const Divider(height: 1.0),
      itemBuilder: (context, index) {
        JuzModel juz = juzList[index];
        return ListTile(
          leading: StarWidget(content: juz.index.toString()),
          title: Text(juz.start?.name ?? ''),
          subtitle: Text('${juz.start?.verse} оят дан бошланади'),
          onTap: () {
            AppNavigator.push(JuzScreen(juz: juz));
          },
        );
      },
    );
  }
}
