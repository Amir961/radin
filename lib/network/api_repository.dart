import 'dart:io';
import 'package:get/get.dart';
import 'package:radin/models/response.dart';
import 'package:radin/network/api_constants.dart';


import 'api_provider.dart';

class APIRepository {
  final provider = Get.find<APIProvider>();

  Map<String, String> authHeader(
      {bool isTest = false,  bool isCont = false, String? cont}) {
    String? token;
    if (isTest) {
      token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsibm9ybWFsIiwicHJlbWl1bSIsInN1cGVyIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im5vcm1hbCIsIlgtSGFzdXJhLVVzZXItSWQiOiI1Y2MzMmFlOC02ZTA0LTQxMjEtYjZiMC01MTgyMDNmY2JkMTAifSwiaWF0IjoxNjk5MDMzODM0LCJleHAiOjE3MDUyNTQ2MzR9.Zo9ng2uE3icGTXg6QllGKtc8v1m_YIOlvoZ_aTXwTtY";
    } else {
    //  token = GetStorage().read(PreferenceKey.accessToken);
    }
    // String? type = GetStorage().read(PreferenceKey.accessType);
    var mapObj = <String, String>{};
    mapObj[APIKeyConstants.accept] = APIKeyConstants.vAccept;
    if (isCont) {
      mapObj[APIKeyConstants.contentType] = cont ?? "application/json; charset=UTF-8";
    }
    // mapObj[APIKeyConstants.userApiSecret] = dotenv.env[EnvKeyValue.kApiSecret] ?? "";
    // mapObj[APIKeyConstants.lang] = LanguageUtil.getCurrentKey();
    // mapObj[APIKeyConstants.userAgent] = gUserAgent;
    if (token != null && token.isNotEmpty) {
      mapObj[APIKeyConstants.authorization] =
      "${APIKeyConstants.vBearer} $token";
    }
    return mapObj;
  }





  Future<MultipartFile> makeMultipartFile(File file) async {
    List<int> arrayData = await file.readAsBytes();
    MultipartFile multipartFile = MultipartFile(arrayData, filename: file.path);
    return multipartFile;
  }




  /// *** POST requests *** ///


  Future<ServerResponse> sendResponse(questionId,answer) async {
    var mapObj = <String, dynamic>{};
    mapObj[APIKeyConstants.questionId] = questionId;
    mapObj[APIKeyConstants.answer] = answer;
    return provider.postRequest(
      APIURLConstants.getListResponse,
      mapObj,
      authHeader(isTest: true),
    );
  }



  /// *** ------------ *** ///
  /// *** GET requests *** ///
  /// *** ------------ *** ///


  Future<ServerResponse> getListQuestion() async {
    var mapObj = <String, dynamic>{};
    mapObj[APIKeyConstants.userId] = "f45f67df-6e90-4859-a4cc-de32ef71ee5b";
    return provider.getRequest(
      APIURLConstants.getListQuestion,
      query: mapObj,
      authHeader(isTest: true),
    );
  }

  Future<ServerResponse> getListResponse() async {
    var mapObj = <String, dynamic>{};
    mapObj[APIKeyConstants.questionId] = "0d180e6c-071b-4b21-b73c-b6be05e97922";
    return provider.getRequest(
      APIURLConstants.getListResponse,
      query: mapObj,
      authHeader(isTest: true),
    );
  }




}
