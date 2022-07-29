import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:get/get.dart';

class CrewPresenter extends GetxController {
  List<Crew> crews = [];

  List<Crew> get myCrews => crews.where((crew) {
    return crew.memberUids
        .contains(Get.find<UserPresenter>().loggedUser.uid);
  }).toList();

  List<Crew> getSearchedCrews(String keyword) {
    List<Crew> filteredCrews = [];
    for (Crew crew in crews) {
      if (crew.title!.contains(keyword)) filteredCrews.add(crew);
    }
    return filteredCrews;
  }

  void addCrew(Crew crew) {
    crews.add(crew);
    update();
  }

  Future load() async {
    final jsonList = (await f.collection('crews').get()).docs;
    crews = [];
    for (var data in jsonList) {
      Map<String, dynamic> json = data.data();
      addCrew(Crew.fromJson(json));
    }
  }

  void saveOne(Crew crew) {
    f.collection('crews').doc(crew.code).set(crew.toJson());
  }
}
