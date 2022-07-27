import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../presenter/page/add_crew/add_crew.dart';

enum DateType { start, end }

class AddCrew extends StatelessWidget {
  const AddCrew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crewCont = TextEditingController();
    final timesCont = TextEditingController();
    final descCont = TextEditingController();

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
                        controller: crewCont,
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
              const Divider(
                thickness: 1.0,
              ),
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
                    ListTile(
                      title: const Text('offline'),
                      leading: Radio<ParticipationMethod>(
                        value: ParticipationMethod.offline,
                        groupValue: controller.method,
                        onChanged: (ParticipationMethod? value) {
                          controller.changeMethod(value!);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('online'),
                      leading: Radio<ParticipationMethod>(
                        value: ParticipationMethod.online,
                        groupValue: controller.method,
                        onChanged: (ParticipationMethod? value) {
                          controller.changeMethod(value!);
                        },
                      ),
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
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            value: controller.period,
                            items: <String>['매일', '매주', '매월']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              controller.changePeriod(value!);
                            },
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: TextFormField(
                          enabled: controller.period == '매일' ? false : true,
                          controller: timesCont,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: controller.period == '매일' ? '매일' : '횟수',
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Period',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const DateSelectionButton(type: DateType.start),
              const DateSelectionButton(type: DateType.end),
              const Divider(
                thickness: 1.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: descCont,
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
    return GetBuilder<AddCrewPresenter>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              {
                DateType.start: '시작일',
                DateType.end: '종료일',
              }[type]!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: {
                      DateType.start: controller.startDateSelected,
                      DateType.end: controller.endDateSelected,
                    }[type]!,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                                DateFormat('yyyy년 MM월 dd일').format(
                                    (type == DateType.start
                                            ? controller.startDate
                                            : controller.endDate) ??
                                        DateTime.now()),
                                style: Theme.of(context).textTheme.labelLarge,
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
    });
  }
}
