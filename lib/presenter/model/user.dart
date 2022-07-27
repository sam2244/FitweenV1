import 'package:fitweenV1/model/user.dart';
import 'package:get/get.dart';

class UserPresenter extends GetxController {
  static FWUser user = FWUser.fromJson({
    'uid': 'a',
    'nickname': '현승준',
  });
}