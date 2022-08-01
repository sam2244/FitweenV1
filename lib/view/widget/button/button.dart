/* 커스텀 버튼 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/view/widget/widget/text.dart';
import 'package:flutter/material.dart';

/// class
class FWButton extends StatelessWidget {
  const FWButton({
    Key? key,
    this.text,
    this.child,
    required this.onPressed,
    this.fill = false,
  }) : assert(
  text == null || child == null,
  ), super(key: key);

  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final bool fill;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorScheme.primary,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: child ?? FWText(text!,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
