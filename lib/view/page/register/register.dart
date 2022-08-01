/* 회원가입 페이지 */

import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/page/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterPresenter>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 100.0, child: Text('닉네임')),
                    Expanded(
                      child: TextFormField(
                        controller: RegisterPresenter.nicknameCont,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 100.0, child: Text('생년월일')),
                    Expanded(
                      child: TextButton(
                        child: Text('${controller.newcomer.dateOfBirthString}'),
                        onPressed: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: controller.newcomer.dateOfBirth ?? DateTime(1999, 3, 5),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          controller.setDateOfBirth(selectedDate);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio<Sex>(
                          value: Sex.male,
                          groupValue: controller.newcomer.sex,
                          onChanged: controller.setSex,
                        ),
                        const Text('남성'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Sex>(
                          value: Sex.female,
                          groupValue: controller.newcomer.sex,
                          onChanged: controller.setSex,
                        ),
                        const Text('여성'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: controller.submitted,
                      child: const Text('가입완료'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
