import 'package:flutter/material.dart';
import 'package:training_app/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Your Program',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppColor.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 220,
              padding: const EdgeInsets.only(
                  top: 25, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(
                          5,
                          10,
                        ),
                        blurRadius: 10,
                        color: AppColor.gradientSecond.withOpacity(0.3))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColor.gradientFirst.withOpacity(0.8),
                        AppColor.gradientSecond.withOpacity(0.9)
                      ]),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(80),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Legs Toning \nand Glutes Workout',
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColor.homePageContainerTextSmall),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '60 min',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.homePageContainerTextSmall),
                            )
                          ],
                        ),
                        Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8))
                          ]),
                          child: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    )
                  ]),
            )
          ],
        )),
      ),
    );
  }
}
