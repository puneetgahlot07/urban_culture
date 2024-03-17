import 'package:cloud_firestore/cloud_firestore.dart';

class RoutineModel {
  String title;
  String des;
  String time;
  // Add other fields as needed

  RoutineModel({
    required this.title,
    required this.des,
    required this.time,
    // Add other parameters as needed
  });

  // Create a factory method to convert Firestore data into a Routine object
  // factory Routine.fromFirestore(Map<String, dynamic> data) {
  //   return Routine(
  //     title: data['title'],
  //     des: data['des'],
  //     time: data['time'],
  //     // Map other fields accordingly
  //   );
  // }
  factory RoutineModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return RoutineModel(
      title: data['title'] ?? '',
      des: data['des'] ?? '',
      time: data['time'] ?? '',
    );
  }
}
