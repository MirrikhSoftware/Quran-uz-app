/*

  Created by: Bakhromjon Polat
  Created on: Mar 01 2023 18:17:09
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/widgets.dart';

class HighlightTextWidget extends StatelessWidget {
  final String source;
  final String query;
  const HighlightTextWidget({
    Key? key,
    required this.source,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: _highlightOccurrences()));
  }

  List<TextSpan> _highlightOccurrences() {
    TextStyle simpleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    TextStyle highlightedStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    if (!source.toLowerCase().contains(query.toLowerCase())) {
      return [
        TextSpan(text: source, style: simpleStyle),
      ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
            style: simpleStyle,
          ),
        );
      }

      children.add(
        TextSpan(
          text: source.substring(match.start, match.end),
          style: highlightedStyle,
        ),
      );

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
            style: simpleStyle,
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
