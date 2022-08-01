/* 메인 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/view/page/main/widget.dart';
import 'package:fitweenV1/view/widget/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPresenter>(
      builder: (mainCont) {
        return Stack(
          children: [
            Scaffold(
              appBar: const MainAppBar(),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SmartRefresher(
                  header: MaterialClassicHeader(
                    color: Colors.white,
                    backgroundColor: colorScheme.primary,
                  ),
                  enablePullUp: false,
                  onRefresh: MainPresenter.onRefresh,
                  onLoading: MainPresenter.onLoading,
                  controller: MainPresenter.refreshCont,
                  child: SingleChildScrollView(
                    child: GetBuilder<CrewPresenter>(
                      builder: (crewCont) {
                        return Column(
                          children: crewCont.crews.map((crew) {
                            return CrewCard(crew: crew);
                          }).toList(),
                        );
                      }
                    ),
                  ),
                ),
              ),
              floatingActionButton: const AddCrewButton(),
              bottomNavigationBar: const FWBottomBar(),
            ),
            if (mainCont.detailLoading)
            Positioned.fill(
              child: Container(
                color: FWTheme.black.withOpacity(.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
