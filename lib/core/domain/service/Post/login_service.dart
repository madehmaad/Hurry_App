import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/login_model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';

class LoginService extends Service {
  Future<Model> login({required LoginModel model}) async {
    try {
      response =
          await dio.post(Url().baseUrl + Url().loginUrl, data: model.toJson());

      // print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        TokenModel result = TokenModel(token: temp['token']);
        print(result);
        return result;
      } else {
        dynamic temp = response.data;
        print(response.data);
        ErrorModel result = ErrorModel(error: temp.error);
        return result;
      }
    } catch (e) {
      
      ExceptionModel result = ExceptionModel(excption: e.toString());
      return result;
    }
  }
}
