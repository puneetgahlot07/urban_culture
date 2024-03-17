import 'package:get/get.dart';
import 'package:urban_culture/controller/navbar_controller.dart';
import 'package:urban_culture/controller/routine_controller.dart';

Future<void> init() async {
  Get.lazyPut<BottomBarController>(() => BottomBarController(), fenix: true);
  Get.lazyPut<RoutineController>(() => RoutineController(), fenix: true);
}
