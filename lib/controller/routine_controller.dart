import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:urban_culture/model/routine_model.dart';
import 'package:urban_culture/screen/routine.dart';

class RoutineController extends GetxController {
  bool userloading = true;
  List<RoutineModel> routines = [];

  Future<void> getRoutineList() async {
    try {
      routines.clear();
      userloading = true;
      update();
      var usersStream = FirebaseFirestore.instance.collection('routine').get();
      usersStream.then((value) {
        value.docs.forEach((doc) {
          RoutineModel routine = RoutineModel.fromSnapshot(doc);
          log(routine.title.toString());
          routines.add(routine);
        });
        userloading = false;
        update();
        // log(user.toString());
      });
    } catch (e) {
      userloading = false;
      update();
    }
  }
}
