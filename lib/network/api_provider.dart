
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:radin/models/response.dart';
import 'package:radin/network/api_constants.dart';






class APIProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = APIURLConstants.baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.timeout = const Duration(seconds: 120);
    httpClient.sendUserAgent=true;

    super.onInit();
  }

  void printFunction(String tag, dynamic data) {
    if (kDebugMode) GetUtils.printFunction("$tag => ", data, "");
  }





  /// *** Common Server Request *** ///
  Future<ServerResponse> postRequest(
      String url, Map body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("postRequest body", body);
    printFunction("postRequest headers", headers);
    print(url);
    final response = await post(url, body, headers: headers);
    // final response = await post(url, body,);

    GetUtils.printFunction("postRequest url", response.request?.url, "");
    print(response.request?.url.toString());

    return handleResponse(response, isDynamic: isDynamic);
  }

  Future<ServerResponse> patchRequest(
      String url, Map body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("postRequest body", body);
    printFunction("postRequest headers", headers);
    print(url);
    final response = await patch(url, body, headers: headers);
    // final response = await post(url, body,);

    GetUtils.printFunction("postRequest url", response.request?.url, "");
    print(response.request?.url.toString());

    return handleResponse(response, isDynamic: isDynamic);
  }

  Future<ServerResponse> putRequest(
      String url, Map body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("putRequest body", body);
    printFunction("putRequest headers", headers);
    print(url);
    final response = await put(url, body, headers: headers);
    // final response = await post(url, body,);

    GetUtils.printFunction("putRequest url", response.request?.url, "");
    print(response.request?.url.toString());

    return handleResponse(response, isDynamic: isDynamic);
  }


  Future<ServerResponse> getRequest(String url, Map<String, String> headers,
      {Map<String, dynamic>? query, bool? isDynamic}) async {
    printFunction("getRequest query", query);
    printFunction("getRequest headers", headers);

    final response = await get(url, headers: headers, query: query);

    printFunction("getRequest url ", response.request?.url);
    print(response.request?.url.toString());
    return handleResponse(response, isDynamic: isDynamic);
  }





  Future<ServerResponse> deleteRequest(String url, Map<String, String> headers,
      {Map<String, dynamic>? query, bool? isDynamic}) async {
    printFunction("deleteRequest query", query);
    printFunction("deleteRequest headers", headers);
    final response = await delete(url, headers: headers, query: query);
    printFunction("deleteRequest url ", response.request?.url);
    return handleResponse(response, isDynamic: isDynamic);
  }

  Future<ServerResponse> postRequestFormData(
      String url, Map<String, dynamic> body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("postRequestFormData body", body);
    printFunction("postRequestFormData headers", headers);
    final response = await post(url, FormData(body), headers: headers);
    printFunction("postRequestFormData url", response.request?.url);
    return handleResponse(response, isDynamic: isDynamic);
  }
  Future<ServerResponse> postRequestFormData2(
      String url, FormData body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("postRequestFormData body", body);
    printFunction("postRequestFormData headers", headers);
    final response = await post(url, body, headers: headers);
    printFunction("postRequestFormData url", response.request?.url);
    return handleResponse(response, isDynamic: isDynamic);
  }


  Future<ServerResponse> patchRequestFormData2(
      String url, dynamic body, Map<String, String> headers,
      {bool? isDynamic}) async {
    printFunction("postRequestFormData body", body);
    printFunction("postRequestFormData headers", headers);
    final response = await patch(url, body, headers: headers);
    printFunction("postRequestFormData url", response.request?.url);
    return handleResponse(response, isDynamic: isDynamic);
  }

  Future<ServerResponse> patchRequestFormData(
      String url, Map<String, dynamic> body, Map<String, String> headers,
      {bool? isDynamic,bool toJson = false,String? json}) async {
    printFunction("postRequestFormData body", body);
    printFunction("postRequestFormData headers", headers);

    final response = await patch(url, !toJson ? FormData(body) : json , headers: headers);
    printFunction("postRequestFormData url", response.request?.url);
    print(body.toString());
    return handleResponse(response, isDynamic: isDynamic);
  }

  Future<ServerResponse> patchRequestFormDataJson(
      String url, Map<String, String> headers,
      {bool? isDynamic,String? json}) async {
    printFunction("postRequestFormData body", json);
    printFunction("postRequestFormData headers", headers);

    final response = await patch(url,  json , headers: headers);
    printFunction("postRequestFormData url", response.request?.url);
    return handleResponse(response, isDynamic: isDynamic);
  }





  Future<ServerResponse> uploadFile(String url, List<int> img, String filename,
      Map<String, String> headers) async {
    printFunction("uploadFile headers", headers);
    final avatar = MultipartFile(img, filename: filename);
    final response = await post(
        url, FormData({APIKeyConstants.vProfilePhotoPath: avatar}),
        headers: headers);
    printFunction("uploadFile url", response.request?.url);
    return handleResponse(response);
  }

  Future<ServerResponse> handleResponse(Response response,
      {bool? isDynamic}) async {
    printFunction("handleResponse statusText", response.statusText);
    printFunction("handleResponse statusCode", response.statusCode);
    printFunction("handleResponse hasError", response.status.hasError);
    if (response.statusCode == 401) {
      // logOutActions();
      // return Future.error(response.body?['data']?? response.statusText as String);
      return Future.error( response.statusText as String);
    }

    if (response.status.hasError) {
      if (response.status.connectionError) {
        return Future.error(
            "لطفاً اتصال اینترنت خود را تأیید کنید و دوباره امتحان کنید");
      }
      if(response.statusCode == 302){
        return Future.error("302 Found");
      }
      if ((response.statusCode == 422 &&
          response.statusText == "Unprocessable Content") ) {
        if(response.body['errors'] !=null){
          Map<String, dynamic> er = response.body['errors'];
          return Future.error(er[er.keys.first][0]);

        }
        else if (response.body['message'].runtimeType == String) {
          return Future.error(response.body['message']);



        } else {
          Map<String, dynamic> er = response.body['message'];
          return Future.error(er[er.keys.first][0]);
        }
      }
      if(response.statusCode == 400){
        if(response.body['message'] !=null){
          Map<String, dynamic> er = response.body['data'];
          return Future.error(er[er.keys.first][0]);

        }else{

          return Future.error(response.body['data']);

        }


      }


    } else {
      printFunction("handleResponse body", response.body);
      if (isDynamic != null && isDynamic) {
        return ServerResponse(success: true, message: "", data: response.body);
      } else if (response.body.runtimeType==Map && ServerResponse.isServerResponse(response.body)) {
        return ServerResponse.fromJson(response.body);
      } else {
        return ServerResponse(success: true, message: "", data: response.body);
      }
    }
    return Future.error(
        (response.body['message'] ?? response.statusText) as String);
  }
}



///dio: ^4.0.6

/// PLEASE DO NOT DELETE ///
/*httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });*/
/*httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      request.headers['Authorization'] = "$token";
      request.headers['Accept'] = "application/json";
      return request;
    });*/
/*httpClient.addResponseModifier<CasesModel>((request, response) {
      CasesModel model = response.body;
      if (model.countries.contains('Brazil')) {
        model.countries.remove('Brazilll');
      }
    });*/
