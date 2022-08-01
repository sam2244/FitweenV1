/* 커스텀 텍스트 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:flutter/material.dart';

/// class
class FWText extends StatelessWidget {
  FWText(this.data, {
    Key? key,
    this.style,
    this.color,
  }) : super(key: key);

  final String data;
  TextStyle? style;
  Color? color;

  @override
  Widget build(BuildContext context) {
    style ??= textTheme.bodyMedium;
    color ??= colorScheme.primary;
    return Text(data,
      overflow: TextOverflow.ellipsis,
      style: style?.apply(color: color),
    );
  }
}
