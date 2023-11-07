import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:radin/modules/home/tabs/profile/profile_controller.dart';
import 'package:radin/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.getResponse();
    super.initState();
  }

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
                      GestureDetector(onTap: (){
                        controller.pageIndex.value=0;
                      },child: SvgPicture.asset("assets/icons/back.svg")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ]),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'نظری دارید؟',
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
              child: const TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                style: TextStyle(
                    fontFamily:'Yekan Bakh', fontWeight: FontWeight.normal),
                decoration: InputDecoration(
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
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: hexToColor('#3C57EF')),
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                    ),
                    child: const Text(
                      'ارسال',
                      style: TextStyle(
                        color: Color(0xFF3C57EF),
                        fontSize: 18,
                         
                        fontWeight: FontWeight.w400,
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
                  'آخرین نظرات  کاربران',
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 18,
                     
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.loading.value ? 8 : controller.responses
                    .length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return controller.loading.value
                      ? itemLoading()
                      : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size:
                            const Size.fromRadius(22.5), // Image radius
                            child: Image.asset('assets/image/avatar.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
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
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                controller.responses[index].answer ?? "",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
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
                });
          }),
        ],
      ),
    );
  }

  Widget itemLoading() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 36, vertical: 24),
      child: Shimmer.fromColors(
        baseColor: ColorConstants.blue,
        highlightColor: hexToColor("#9434E8"),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(
                    22.5), // Image radius
                child: const ColoredBox(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 8,
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(8))),
                      ),
                      Container(
                        height: 8,
                        width: 90,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(8))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2),
                    height: 8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(8))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2),
                    height: 8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(8))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2),
                    height: 8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(8))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2),
                    height: 8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(8))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
