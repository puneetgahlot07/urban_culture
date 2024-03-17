import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/app_color.dart';
import 'package:urban_culture/controller/navbar_controller.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({Key? key}) : super(key: key);

  final controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(builder: (controller) {
      // if()
      return Scaffold(
          backgroundColor: AppColors.primaryColor,
          key: controller.key,
          body: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.3,
                          color: AppColors.textColor.withOpacity(0.6)))),
              child:
                  controller.widgetOptions.elementAt(controller.selectedIndex)),
          endDrawerEnableOpenDragGesture: false,
          bottomNavigationBar: BottomAppBar(
            color: AppColors.primaryColor,
            // elevation: 20,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectedIndex = 0;
                    controller.update();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: AppColors.textColor),
                      Text(
                        "Routine",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    controller.selectedIndex = 1;
                    controller.update();
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group, color: AppColors.textColor),
                      Text(
                        "Streaks",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
