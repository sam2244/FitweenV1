import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../model/crew.dart';

enum CrewState {onging, done}

class MyCrewCard extends StatelessWidget {
  const MyCrewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350.0,
      child: Card(
        elevation: 20,
        color: Colors.white,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyCrewTitle(),
            //MyCrewCheckboxView(),
            //MyCrewPeriodView(),
            PeriodSearchButton()
          ]
        ),
      ),
    );
  }
}

class MyCrewTitle extends StatelessWidget {
  const MyCrewTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '나의 크루 조회',
      style: TextStyle(
          color: Colors.black,
          fontSize: 28.0,
          fontWeight: FontWeight.w400),
    );
  }
}

class MyCrewPeriodView extends StatelessWidget {
  const MyCrewPeriodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PeriodSearchButton extends StatelessWidget {
  const PeriodSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCrewPresenter>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 44.0,
            color: Colors.black,
            child: const Center(
              child: TextButton(
                onPressed: MyCrewPresenter.periodSearchButtonPressed,
                child: Text('조회하기',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
