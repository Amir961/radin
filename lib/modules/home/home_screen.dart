import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radin/modules/home/home.dart';
import 'package:radin/shared/shared.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      extendBody: true,
      body: _buildContent(controller.currentTab.value),
      bottomNavigationBar: Container(
          height: 66,
          width: SizeConfig().screenWidth,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [
                  hexToColor("#9434E8"),
                  hexToColor("#4B63EA"),
                ],
              )),
          child: Row(
            children: List.generate(5, (index) => _buildNavigationBarItem(index)),
          )),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.profile:
        return controller.profileTab;
      case MainTabs.notifications:
        return controller.notificationsTab;
      case MainTabs.backpack:
        return controller.backpackTab;
      case MainTabs.tent:
        return controller.tentTab;
      case MainTabs.hand:
        return controller.handTab;
      default:
        return controller.profileTab;
    }
  }

  Widget _buildNavigationBarItem(int index,) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          controller.switchTab(index);
        },
        child: SizedBox(
          child: SvgPicture.asset(
            'assets/icons/${controller.icon[index]}.svg',
            color: controller.getCurrentTab(index) == controller.currentTab.value
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
