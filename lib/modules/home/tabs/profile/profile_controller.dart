import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radin/models/question_model.dart';
import 'package:radin/models/response_model.dart';
import 'package:radin/network/api_repository.dart';
import 'package:radin/shared/utils/common_widget.dart';

class ProfileController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getQuestion();
  }

  RxInt indexTab=1.obs;
  RxInt pageIndex =0 .obs;
  List<String> tab =['بیوگرافی','تماس با من','فعالیت ها','امتیازات'];
  RxBool loading=true.obs;
  RxBool anonymous=true.obs;

  RxList<QuestionModel> questions =<QuestionModel>[].obs;
  RxList<ResponseModel> responses =<ResponseModel>[].obs;

  TextEditingController answerTextEditingController = TextEditingController();

  String questionId="";
  String textQuestion="";


  void getQuestion() {
    loading.value = true;
    APIRepository().getListQuestion().then((resp) async {
      if (resp.success) {
          questions.value = List<QuestionModel>.from(
              resp.data['ireme_question']!.map((x) => QuestionModel.fromJson(x)));
          loading.value = false;
      } else {
       // showToastRequestError();
      }
    }, onError: (err) {
      loading.value = false;
      CommonWidget.toast(err.toString().tr);
    });
  }

  void getResponse() {
    loading.value = true;
    APIRepository().getListResponse().then((resp) async {
      if (resp.success) {
        responses.value = List<ResponseModel>.from(
              resp.data['ireme_question_response']!.map((x) => ResponseModel.fromJson(x)));
          loading.value = false;
      } else {
       // showToastRequestError();
      }
    }, onError: (err) {
      loading.value = false;
      CommonWidget.toast(err.toString().tr);
    });
  }

  void sendResponse() {
    loading.value = true;
    APIRepository().sendResponse(questionId,answerTextEditingController.text).then((resp) async {
      if (resp.success) {
          loading.value = false;
          CommonWidget.toast("OK");
          answerTextEditingController.clear();
      } else {
       // showToastRequestError();
      }
    }, onError: (err) {
      loading.value = false;
      CommonWidget.toast(err.toString().tr);
    });
  }

  

}