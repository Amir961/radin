import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radin/modules/home/tabs/profile/comments_screen.dart';
import 'package:radin/modules/home/tabs/profile/profile_controller.dart';
import 'package:radin/modules/home/tabs/profile/question_screen.dart';
import 'package:radin/shared/shared.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final ProfileController controller = Get.put(ProfileController());




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.pageIndex.value == 0
          ? profileTabPage()
          :controller. pageIndex.value == 1
              ? const QuestionScreen()
              : const CommentsScreen();
    });
  }


  Widget profileTabPage(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            SvgPicture.asset(
              "assets/icons/top_bg.svg",
              fit: BoxFit.cover,
              width: SizeConfig().screenWidth,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/settings.svg"),
                      SvgPicture.asset("assets/icons/back.svg"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 185,
                  height: 185,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      annotations: [
                        GaugeAnnotation(
                          angle: 0,
                          positionFactor: 0.5,
                          widget: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(
                                  75), // Image radius
                              child: Image.asset(
                                  'assets/image/avatar.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )
                      ],
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 270,
                      endAngle: 270,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 1,
                        color: Colors.transparent,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: 100,
                          width: 0.15,
                          color: Colors.grey[300],
                          pointerOffset: 0.1,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        const RangePointer(
                          value: 75.8,
                          width: 0.15,
                          color: Color(0xffF69631),
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            )
          ]),
          const Text(
            'عباس بوعذار',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
               
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'بازیکن فوتبال',
            style: TextStyle(
              color: Color(0xFFC4C4C4),
              fontSize: 15,
               
              fontWeight: FontWeight.w400,
              height: 0.07,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      )
                    ]),
                child: const Column(
                  children: [
                    Text(
                      '۱۶۳',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                         
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'ستاره ها',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 12,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      )
                    ]),
                child: const Column(
                  children: [
                    Text(
                      '۸۷',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                         
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'فعالیت ها',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 12,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      )
                    ]),
                child: const Column(
                  children: [
                    Text(
                      '۲۰۹',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                         
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'دوستان',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 12,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
                () => Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => itemTab(index)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 36, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'تلفن:',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 15,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      '۰۹۳۷ ۰۹۵ ۹۴۷۲',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 15,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/icons/phone.svg")
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Text(
                      'ایمیل:',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 15,
                         
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      ' yedooneredare@gmail.com',
                      style: TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 15,
                         
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/icons/email.svg")
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'شبکه های اجتماعی:',
                    style: TextStyle(
                      color: Color(0xFFADADAD),
                      fontSize: 15,
                       
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/instagram.svg"),
                    const SizedBox(
                      width: 36,
                    ),
                    SvgPicture.asset("assets/icons/x.svg"),
                    const SizedBox(
                      width: 36,
                    ),
                    SvgPicture.asset("assets/icons/linkin.svg"),
                    const SizedBox(
                      width: 36,
                    ),
                    SvgPicture.asset("assets/icons/facebook.svg"),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'سوالات:',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 15,
                     
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: SizeConfig().screenWidth,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.loading.value ? 8 : controller.questions.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.textQuestion=controller.questions[index].question??"";
                      controller.questionId=controller.questions[index].id??"";
                      controller.pageIndex.value = 1;
                    },
                    child: !controller.loading.value
                        ? Container(
                      margin: EdgeInsets.only(
                          left: 14, right: index == 0 ? 32 : 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      height: 120,
                      width: 190,
                      decoration: BoxDecoration(
                          color:ColorConstants.blue,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(16))),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.questions[index].question}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                               
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '14   پاسخ ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                               
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                        : Shimmer.fromColors(
                      baseColor: ColorConstants.blue,
                      highlightColor: hexToColor("#9434E8"),
                      child: Container(
                        height: 110,
                        width: 190,
                        margin: EdgeInsets.only(
                            left: 14, right: index == 0 ? 32 : 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(16))),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                const Text(
                  'نظرات:',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 15,
                     
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      controller.pageIndex.value = 2;
                    },
                    child: SvgPicture.asset("assets/icons/add.svg"))
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36, vertical: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(
                              22.5), // Image radius
                          child: Image.asset('assets/image/avatar.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'مهدی طارمی',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                     
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'روز پیش2',
                                  style: TextStyle(
                                    color: Color(0xFF818181),
                                    fontSize: 10,
                                     
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                 
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child:
                        SvgPicture.asset('assets/icons/heart.svg'),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget itemTab(int index) {
    return InkWell(
      onTap: () {
        controller.indexTab.value = index;
      },
      child: Column(
        children: [
          const Spacer(),
          Text(
            controller.tab[index],
            style: TextStyle(
              color: controller.indexTab.value == index
                  ? Colors.black
                  : const Color(0xFF818181),
              fontSize: 12,
               
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          if (controller.indexTab.value == index)
            Container(
              height: 1,
              width: 50,
              color: hexToColor("#5536FF"),
            )
        ],
      ),
    );
  }
}
