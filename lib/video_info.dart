import 'package:flutter/material.dart';
import 'package:training_app/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
                colors: [
              AppColor.gradientFirst.withOpacity(0.9),
              AppColor.gradientSecond,
            ])),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                color: Colors.redAccent.withOpacity(0.5),
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.secondPageIconColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: AppColor.secondPageIconColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Legs Toning \nand Glutes Workout',
                        style: TextStyle(
                            fontSize: 25, color: AppColor.secondPageTitleColor),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
