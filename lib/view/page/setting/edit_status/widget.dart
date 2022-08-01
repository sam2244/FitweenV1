/* 상태메세지 수정 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStatusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditStatusAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: [
        GetBuilder<SettingPresenter>(
          builder: (controller) {
            return IconButton(
              icon: Icon(
                Icons.check,
                color: colorScheme.primary,
              ),
              onPressed: controller.statusSubmitted,
            );
          },
        ),
      ],
    );
  }
}

class StatusMessageTextField extends StatelessWidget {
  const StatusMessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 8.0),
                      child: Text(
                        "상태메세지",
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    TextFormField(
                      controller: SettingPresenter.statusCont,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: '상태메세지를 입력하세요',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            //padding: const EdgeInsets.all(.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: colorScheme.surface,
                                border: Border.all(
                                    width: 2
                                )
                            ),
                            child: IconButton(
                                onPressed: SettingPresenter.statusCont.clear,
                                icon: Icon(Icons.clear,
                                    color: colorScheme.onSurfaceVariant)
                              /*CircleAvatar(
                              backgroundColor: colorScheme.surface,
                              radius: 100,
                              child: Icon(Icons.clear,
                              color: colorScheme.onSurfaceVariant),
                              ),*/
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(color: colorScheme.outline),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '상태메세지를 입력하세요';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}