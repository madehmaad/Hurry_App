import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/verteses_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';

List<String> Bus = [];

class VertesesService extends Service {
  Future<List<Model>> getVerteses() async {
    try {
      response = await dio.get(Url().baseUrl + Url().admin + Url().vertices);
      if (response.statusCode == 200) {
        dynamic temp = response.data;
        List<vertesesModel> result = List.generate(
            temp.length, (index) => vertesesModel.fromMap(temp[index]));
        Bus = List.generate(result.length, (ind) => result[ind].name);

        // print(result);
        return result;
      } else {
        dynamic temp = response.data;
        // print(response.statusCode);
        List<ErrorModel> result = [ErrorModel(error: temp['error'])];
        return result;
      }
    } catch (e) {
      List<ExceptionModel> result = [ExceptionModel(excption: e.toString())];
      return result;
    }
  }
}
