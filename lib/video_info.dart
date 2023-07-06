import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      videoInfo = json.decode(value);
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
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.secondPageIconColor,
                              size: 20,
                            ),
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
                    Expanded(
                        child: ListView.builder(
                      itemCount: videoInfo.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      itemBuilder: (BuildContext context, int index) {
                        final item = videoInfo[index];
                        return GestureDetector(
                            onTap: () {
                              debugPrint(index.toString());
                            },
                            child: _listView(item));
                      },
                    ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _listView(dynamic item) {
    return SizedBox(
      height: 135,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(item['thumbnail']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item['time'],
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Container(
              height: 20,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffeaeefc),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                '15s rest',
                style: TextStyle(color: Color(0xff839fed)),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < 70; i++)
                  i.isEven
                      ? Container(
                          width: 3,
                          height: 1,
                          decoration: BoxDecoration(
                              color: const Color(0xff939fed),
                              borderRadius: BorderRadius.circular(2)),
                        )
                      : Container(
                          width: 3,
                          height: 1,
                          color: Colors.white,
                        )
              ],
            )
          ]),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
