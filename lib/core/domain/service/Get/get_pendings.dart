import 'package:dio/dio.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<OrdersModel> ord = [];

class PendingsService extends Service {
  Future<List<Model>> getPendings({required int source}) async {
    try {
      response = await dio.get(Url().baseUrl + Url().pendingOrders,
          queryParameters: {'source_vertices_id': source},
          options: Options(headers: {
            "Authorization":
                "Bearer  " + config.get<SharedPreferences>().getString('token')!
          }));
      if (response.statusCode == 200) {
        dynamic temp = response.data;
        List<OrdersModel> result = List.generate(
            temp.length, (index) => OrdersModel.fromMap(temp[index]));
        // print(result);
        ord = result;
        return result;
      } else {
        dynamic temp = response.data;
        // print(response.statusCode);
        List<ErrorModel> result = [ErrorModel(error: temp['message'])];
        return result;
      }
    } catch (e) {
      List<ExceptionModel> result = [ExceptionModel(excption: e.toString())];

      return result;
    }
  }
}
