import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/request_model/shortest_path_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortPathService extends Service {
  Future<List> getShortPath({required ShortestPathModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().admin + Url().shortestPath,data:model.toJson(), );
      if (response.statusCode == 200) {
        dynamic temp = response.data;
        List<int> result = List.generate(
            temp.length, (index) => temp[index]);
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
