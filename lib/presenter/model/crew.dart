import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:get/get.dart';

class CrewPresenter extends GetxController {
  List<Crew> crews = [];

  void addCrew(Crew crew) {
    crews.add(crew); update();
  }

  void load() async {
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