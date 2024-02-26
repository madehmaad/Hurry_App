import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/regester_model.dart';
import 'package:hurry_project/core/domain/model/token_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';

class SignUpService extends Service {
  Future<Model> SignUp({required RegisterModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().registerUrl,
          data: model.toJson());

      // print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic temp = response.data;
        // print(response.statusCode);
        TokenModel result = TokenModel(token: temp['token']);
        return result;
      } else {
        dynamic temp = response.data;
        // print(response.statusCode);
        ErrorModel result = ErrorModel(error: temp['error']);
        return result;
      }
    } catch (e) {
      
       dynamic temp = response.data;
        // print(response.statusCode);
        ExceptionModel result = ExceptionModel(excption: temp['excption']);
        return result;
    }
  }
}
