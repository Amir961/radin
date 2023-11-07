import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radin/modules/home/tabs/profile/profile_controller.dart';
import 'package:radin/shared/shared.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
  });


  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final ProfileController controller = Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'عباس بوعذار',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                           
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.pageIndex.value = 0;
                          },
                          child: SvgPicture.asset("assets/icons/back.svg")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: 275,
                      decoration: BoxDecoration(
                          color: ColorConstants.blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.textQuestion}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                               
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 8,),
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
                    ),
                  ],
                )
              ],
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'پاسخی برای این سوال دارید؟',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
               
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
              height: 125,
              width: SizeConfig().screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 36),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: hexToColor("#EDEDED"))),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: const TextStyle(
                    fontFamily:'Yekan Bakh', fontWeight: FontWeight.normal),
                controller: controller.answerTextEditingController,
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "نظر من اینه که...",
                    hintStyle: TextStyle(
                      color: Color(0xFFADADAD),
                      fontSize: 12,
                       
                      fontWeight: FontWeight.w300,
                    )),
              )),
          const SizedBox(
            height: 12,
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                children: [
                  CupertinoSwitch(
                      activeColor: hexToColor('#4872FC'),
                      thumbColor: Colors.white,
                      trackColor: Colors.black12,
                      value: controller.anonymous.value,
                      onChanged: (value) => controller.anonymous.value = value),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'به صورت ناشناس',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                       
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.sendResponse();
                    },
                    child: Container(
                      height: 33,
                      width: 116,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                            end: Alignment.topRight,
                            begin: Alignment.bottomLeft,
                            colors: [
                              hexToColor("#9434E8"),
                              hexToColor("#4B63EA"),
                            ],
                          )),
                      child: controller.loading.value
                          ? const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 24),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'ارسال پاسخ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                 
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            );
          }),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Text(
                  'آخرین پاسخ های کابران',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 18,
                     
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(22.5), // Image radius
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: SvgPicture.asset('assets/icons/heart.svg'),
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
