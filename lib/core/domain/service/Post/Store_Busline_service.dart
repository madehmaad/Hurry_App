import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/regester_model.dart';
import 'package:hurry_project/core/domain/model/response_model/store_busline_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';

class StoreBuslineService extends Service {
  Future<Model> StoreBus({required PostBuslineModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().admin + Url().busline,
          data: model.toJson());

      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic temp = response.data;
        // print(response.statusCode);
        ResoursBusLineModel result = ResoursBusLineModel(
            name: temp['name'],
            price: temp['price'],
            city_name: temp['city_name'],
            id: temp['id']);
        return result;
      } else if (response.statusCode == 400) {
        dynamic temp = response.data;
        // print(response.statusCode);
        ErrorModel result = ErrorModel(error: temp['error']);

        return result;
      } else {
        return model;
      }
    } catch (e) {
      ExceptionModel result = ExceptionModel(excption: e.toString());
      print(e);
      return result;
    }
  }
}
