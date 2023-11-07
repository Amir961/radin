

class APIURLConstants {
  static const baseUrl = "https://api.i-re.me/api/";

  ///End Urls : POST
  static const uploadNID = "/api/upload-nid";


  ///End Urls : GET
  static const getListQuestion = "rest/user/question";
  static const getListResponse = "rest/user/question/response";


}

class APIKeyConstants {
  static const accessToken = "accessToken";
  static const accessType = "access_type";
  static const contentType = "Content-Type";
  static const questionId = "question_id";
  static const answer = "answer";
  static const userId = "user_id";
  static const user = "user";

  static const accept = "Accept";
  static const authorization = "Authorization";
  static const token = "token";

  static const userAgent = "User-Agent";




  static const vAccept = "application/json";
  static const vProfilePhotoPath = "";
  static const vBearer = "Bearer";
  static const vOrderDESC = "desc";
  static const vOrderASC = "asc";
}



class ErrorConstants {
  static const unauthorized = "Unauthorized";
}
