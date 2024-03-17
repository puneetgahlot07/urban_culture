import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/screen/routine.dart';
import 'package:urban_culture/screen/streaks.dart';

class BottomBarController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
// for app drawer
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const Routine(),
    const Streaks(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  setValue(int i) {
    selectedIndex = i;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log('In bottombar controller');
    log('In bottombar controllerEnd');
  }
}
