/* 하단 모달 시트 */

import 'package:fitweenV1/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// function
// 하단 모달 시트 표시
void showFWModalBottomSheet(Map<String, VoidCallback> buttonData) {
  Widget modalButton({
    required String text,
    required VoidCallback onPressed,
  }) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: FWTheme.black,
      side: BorderSide(width: 1.0, color: colorScheme.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: onPressed,
    child: Text(text,
      style: const TextStyle(color: FWTheme.white),
    ),
  );

  showModalBottomSheet(
    context: Get.context!,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: colorScheme.surface,
    builder: (BuildContext context) {
      return Container(
        height: 200.0,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: buttonData.entries.map((entry) => modalButton(
              text: entry.key,
              onPressed: entry.value,
            )).toList(),
          ),
        ),
      );
    },
  );
}