import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/store_busline_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';

List<ResoursBusLineModel> Buslines = [];

class BuslineService extends Service {
  Future<List<Model>> getBuslines() async {
    try {
      response = await dio.get(
        Url().baseUrl + Url().admin + Url().busline,
      );
      if (response.statusCode == 200) {
        dynamic temp = response.data;
        List<ResoursBusLineModel> result = List.generate(
            temp.length, (index) => ResoursBusLineModel.fromMap(temp[index]));
        Buslines = result;
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
