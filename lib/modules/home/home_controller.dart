import 'package:radin/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:radin/modules/home/tabs/backpack/backpack_tab.dart';
import 'package:radin/modules/home/tabs/hand/hand_tab.dart';
import 'package:radin/modules/home/tabs/notifications/notifications_tab.dart';
import 'package:radin/modules/home/tabs/tent/tent_tab.dart';

import 'tabs/profile/profile_tab_screen.dart';

class HomeController extends GetxController {



  final List <String> icon =['profile','notifications','backpack','tent','hand'];


  var currentTab = MainTabs.profile.obs;

  late ProfileTab profileTab;
  late NotificationsTab notificationsTab;
  late BackpackTab backpackTab;
  late TentTab tentTab;
  late HandTab handTab;

  @override
  void onInit() async {
    super.onInit();
    profileTab = const ProfileTab();
    notificationsTab = const NotificationsTab();
    backpackTab = const BackpackTab();
    tentTab = const TentTab();
    handTab = const HandTab();
  }


  void switchTab(index) {
    var tab = getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.profile:
        return 0;
      case MainTabs.notifications:
        return 1;
      case MainTabs.backpack:
        return 2;
      case MainTabs.tent:
        return 3;
      case MainTabs.hand:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.profile;
      case 1:
        return MainTabs.notifications;
      case 2:
        return MainTabs.backpack;
      case 3:
        return MainTabs.tent;
      case 4:
        return MainTabs.hand;
      default:
        return MainTabs.profile;
    }
  }
}
