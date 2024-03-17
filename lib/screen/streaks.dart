import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';
// import 'package:get/get_utils/get_utils.dart';
import 'package:urban_culture/app_color.dart';

class Streaks extends StatefulWidget {
  const Streaks({super.key});

  @override
  State<Streaks> createState() => _StreaksState();
}

class _StreaksState extends State<Streaks> {
  var data = [
    0.0,
    1.0,
    1.5,
    -0.6,
    -0.8,
    1.5,
    1.6,
    1.8,
    2.0,
    0.0,
    0.2,
    0.3,
    0.5,
    -0.2,
    -0.3,
    -0.2,
    -0.4,
    -0.5,
    1.0,
    1.5,
    1.5,
    1.6,
    1.8,
    2.0,
    1.8,
    2.0,
    0.0,
    0.2,
    -0.6,
    -0.8,
    -0.7,
    -0.9,
    -1.0,
    -0.5,
    0.0,
    0.0
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Streaks",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const Text(
              "Today's Goal: 3 Streak days",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: Get.height / 9,
                width: Get.width / 1,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Streak Days",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Daliy Streak",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "2",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Text(
                    "Last 30 Days  ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "+100%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   height: Get.height / 4,
            //   width: Get.width / 1,
            //   child: Chart(layers: layers()),
            // )
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: Get.height / 4,
                width: Get.width / 1,
                child: Sparkline(
                  lineColor: AppColors.textColor,
                  lineWidth: 3,
                  data: data,
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.2,
                  // fallbackHeight: 200,
                  // fallbackWidth: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DayMouthUI("1D"),
                DayMouthUI("1W"),
                DayMouthUI("1M"),
                DayMouthUI("3M"),
                DayMouthUI("1Y"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "keep it up!You're on a roll",
              style: TextStyle(),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.blackColor,
                  elevation: 3,
                  backgroundColor: AppColors.secondaryColor),
              child: const Text('Get Started',
                  style: TextStyle(fontWeight: FontWeight.w800)),
            )
          ],
        ),
      ),
    );
  }

  DayMouthUI(String data) {
    return Text(
      data,
      style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
  }

  List<ChartLayer> layers() {
    final from = DateTime(2021, 12);
    final to = DateTime(2022, 12);
    final frequency =
        (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 10.0;
    return [
      // ChartHighlightLayer(
      //   shape: () => ChartHighlightLineShape<ChartLineDataItem>(
      //     backgroundColor: AppColors.textColor,
      //     currentPos: (item) => item.currentValuePos,
      //     radius: const BorderRadius.all(Radius.circular(8.0)),
      //     width: 60.0,
      //   ),
      // ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 300.0,
            max: 200.0,
            min: 00.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => value.toInt().toString(),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: List.generate(
          10,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: Random().nextInt(100) + 20,
          ),
        ),
        settings: const ChartLineSettings(
          color: AppColors.textColor,
          thickness: 4.0,
        ),
      ),
      // ChartTooltipLayer(
      //   shape: () => ChartTooltipLineShape<ChartLineDataItem>(
      //     backgroundColor: Colors.white,
      //     circleBackgroundColor: Colors.white,
      //     circleBorderColor: const Color(0xFF331B6D),
      //     circleSize: 4.0,
      //     circleBorderThickness: 2.0,
      //     currentPos: (item) => item.currentValuePos,
      //     onTextValue: (item) => '',
      //     marginBottom: 6.0,
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 12.0,
      //       vertical: 8.0,
      //     ),
      //     radius: 6.0,
      //     textStyle: const TextStyle(
      //       color: Color(0xFF8043F9),
      //       letterSpacing: 0.2,
      //       fontSize: 14.0,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
    ];
  }
}
