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
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: AppColor.gradientSecond.withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -5),
                              color: AppColor.gradientSecond.withOpacity(0.3))
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/card.jpg',
                          ),
                        ),
                      )),
                  Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width,
                      margin: const EdgeInsets.only(right: 200, bottom: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/figure.png',
                          ),
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You are doing great',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.homePageDetail),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Keep it up\n',
                                style: TextStyle(
                                    color: AppColor.homePagePlanColor,
                                    fontSize: 16),
                                children: const [
                                  TextSpan(text: 'stick to your plan')
                                ]),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of focus',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle,
                      fontSize: 25),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Expanded(
                child: GridView.builder(
              itemBuilder: (context, index) => Container(
                height: 70,
                width: 70,
                padding:EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(5, 5)),
                      BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(-5, -5))
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/ex${index + 1}.png'))),
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'glues',
                      style:
                          TextStyle(fontSize: 20, color: AppColor.homePageDetail),
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ))
          ],
        )),
      ),
    );
  }
}
