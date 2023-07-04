import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_app/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      info = json.decode(value);
      setState(() {});
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

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
                width: MediaQuery.sizeOf(context).width,
                height: 280,
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
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      AppColor
                                          .secondPageContainerGradient1stColor,
                                      AppColor
                                          .secondPageContainerGradient2ndColor
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  color: AppColor.secondPageIconColor,
                                  size: 20,
                                ),
                                Text(
                                  '68 min',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 240,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      AppColor
                                          .secondPageContainerGradient1stColor,
                                      AppColor
                                          .secondPageContainerGradient2ndColor
                                    ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  color: AppColor.secondPageIconColor,
                                  size: 20,
                                ),
                                Text(
                                  'Resistent band, Kettebell',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Circuit1:Legs Toning',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.circuitsColor),
                        ),
                        const SizedBox(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.loop,
                                size: 30,
                                color: AppColor.loopColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '3 sets',
                                style: TextStyle(
                                    fontSize: 15, color: AppColor.setsColor),
                              )
                            ])
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
