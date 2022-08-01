/* 크루 추가 페이지 위젯 */
import 'dart:io';

import 'package:fitweenV1/global/date.dart';
import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/add_crew.dart';
import 'package:fitweenV1/view/widget/widget/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_tag_editor/tag_editor.dart';

/// classes
// 크루 추가 페이지 앱바
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: const Text('크루 추가'),
    );
  }
}

// 크루 추가 전체 뷰
class AddCrewView extends StatelessWidget {
  const AddCrewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return GetBuilder<AddCrewPresenter>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: AddCrewPresenter.titleCont,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '제목',
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Participation Method',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Column(
                      children: ActivityType.values.map((method) {
                        return ListTile(
                          title: Text(method.name),
                          leading: Radio<ActivityType>(
                            value: method,
                            groupValue: controller.type,
                            onChanged: controller.setType,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Number of Activities',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: 100.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<Frequency>(
                            value: controller.frequency,
                            items: Frequency.values.map((value) {
                              return DropdownMenuItem<Frequency>(
                                value: value,
                                child: Text(
                                  value.kr,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              );
                            }).toList(),
                            onChanged: controller.setFrequency,
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: TextFormField(
                          enabled: controller.frequency != Frequency.daily,
                          controller: AddCrewPresenter.countCont,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: controller.frequency == Frequency.daily
                                ? '매일' : '횟수',
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TagEditor(
                      length: controller.newCrew.tags.length,
                      controller: AddCrewPresenter.tagCont,
                      focusNode: focusNode,
                      delimiters: const [',', ' '],
                      hasAddButton: true,
                      resetTextOnSubmitted: true,
                      // This is set to grey just to illustrate the `textStyle` prop
                      textStyle: const TextStyle(color: Colors.grey),
                      onSubmitted: controller.addTag,
                      inputDecoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input tag...',
                      ),
                      onTagChanged: (tag) {
                        controller.addTag(tag);
                      },
                      tagBuilder: (context, index) => FWTagChip(
                        index: index,
                        label: controller.newCrew.tags[index],
                        onDeleted: controller.deleteTag,
                      ),
                      // InputFormatters example, this disallow \ and /
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text('Period',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const DateSelectionButton(type: DateType.start),
              const DateSelectionButton(type: DateType.end),
              const Divider(thickness: 1.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: AddCrewPresenter.descCont,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '설명',
                        ),
                        minLines: 1,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Image(Optional)',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    controller.image == null
                        ? Container()
                        : Container(
                            height: 200.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 16,
                            ),
                            child: Image.file(File(controller.image!.path))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                        height: 20,
                        child: OutlinedButton(
                          onPressed: controller.selectImage,
                          child: const Text('Select'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (controller.image != null) {
                      controller.saveImage();
                    } else {
                      controller.submitted;
                    }
                  },
                  child: const Text('추가하기'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DateSelectionButton extends StatelessWidget {
  const DateSelectionButton({Key? key, required this.type}) : super(key: key);

  final DateType type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCrewPresenter>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text({
                  DateType.start: '시작일',
                  DateType.end: '종료일',
                }[type]!,
                style: textTheme.labelLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: {
                        DateType.start: controller.startDateButtonPressed,
                        DateType.end: controller.endDateButtonPressed,
                      }[type]!,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              right: 8.0,
                              child: Icon(Icons.calendar_month),
                            ),
                            Positioned(
                              child: Center(
                                child: Text(
                                  DateFormat('yyyy년 MM월 dd일').format((type == DateType.start
                                      ? controller.newCrew.startDate
                                      : controller.newCrew.endDate) ?? DateTime.now()),
                                  style: textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
