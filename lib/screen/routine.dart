import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urban_culture/app_color.dart';
import 'package:urban_culture/controller/routine_controller.dart';

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  RoutineController controller = Get.find<RoutineController>();
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.getRoutineList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daliy Skinare",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder(
          init: RoutineController(),
          builder: (_) {
            return controller.routines.isEmpty
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView(
                    // children: [
                    //   Image.network(
                    //      "")
                    // ],
                    children: List.generate(
                        controller.routines.length,
                        (index) => ListTileUi(
                            title: controller.routines[index].title,
                            des: controller.routines[index].des,
                            time: controller.routines[index].time)),
                  );
          },
        ),
      ),
    );
  }

  ListTileUi({required String title, String? des, String? time}) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(child: Icon(Icons.done)),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              // "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              des!,
                              // " ",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    final ImagePicker picker = ImagePicker();
                                    try {
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
                                      var reference = storage
                                          .ref("img/")
                                          .child(image!.path.split("/").last);
                                      UploadTask uploadTask =
                                          reference.putFile(File(image.path));
                                      String url =
                                          await reference.getDownloadURL();
                                      log(url.toString());
                                    } catch (e) {
                                      print('Error fetching download URL: $e');
                                    }
                                  },
                                  child: Image.asset('assets/img/camera.png')),
                              // SvgPicture.asset(
                              //   'assets/img/camara_svg.svg',
                              //   // color: Colors.black,
                              // ),
                              Text(
                                time!,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  // fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ))
        ],
      ),
    ).marginOnly(bottom: 10);
  }
}
