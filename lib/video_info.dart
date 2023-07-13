import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  VideoPlayerController? _controller;
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
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight,
                    colors: [
                    AppColor.gradientFirst.withOpacity(0.9),
                    AppColor.gradientSecond,
                  ]))
            : BoxDecoration(color: AppColor.gradientSecond),
        child: SafeArea(
          child: Column(
            children: [
              playArea == false
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 50),
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
                                  fontSize: 25,
                                  color: AppColor.secondPageTitleColor),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            color:
                                                AppColor.secondPageIconColor),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 240,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            color:
                                                AppColor.secondPageIconColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    )
                  : SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: AppColor.secondPageIconColor,
                                    ))
                              ],
                            ),
                          ),
                          _playView(context),
                          _controlView(context),
                        ],
                      ),
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
                    Expanded(child: _listView())
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: videoInfo.length,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemBuilder: (BuildContext context, int index) {
        final item = videoInfo[index];
        return InkWell(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());

              setState(() {
                if (playArea == false) {
                  playArea = true;
                }
              });
            },
            child: _buildCard(item));
      },
    );
  }

  _buildCard(dynamic item) {
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

  void _onTapVideo(int index) {
    final videoUrl = Uri.parse(videoInfo[index]['videoUrl']);
    final controller = VideoPlayerController.networkUrl(videoUrl);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller.initialize().then((_) {
      old?.dispose();
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  Widget _playView(BuildContext buildContext) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller));
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            'Preparing...',
            style: TextStyle(fontSize: 20, color: Colors.white60),
          )));
    }
  }

  Widget _controlView(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.sizeOf(context).width,
      color: AppColor.gradientSecond,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () async {
              if (_isPlaying) {
                _controller?.pause();
              } else {
                _controller?.play();
              }
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ))
      ]),
    );
  }

  var _onUpdatedControllerTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdatedControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdatedControllerTime > now) {
      return;
    }
    _onUpdatedControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint('controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('controller can not be initialized');
      return;
    }

    final playing = controller.value.isPlaying;
    _isPlaying = playing;
    setState(() {});
  }
}
