import 'package:dio/dio.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:hurry_project/core/resources/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService extends Service {
  Future<Model> getShortPath({required OrdersModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().orders,
          data: model.toJson(),
          options: Options(headers: {
            "Authorization":
                "Bearer  " + config.get<SharedPreferences>().getString('token')!
          }));
      if (response.statusCode == 200) {
        OrdersModel temp = response.data;
        OrdersModel result = OrdersModel(
          id: temp.id,
            top_passenger_count: temp.top_passenger_count,
            current_passenger_count: temp.current_passenger_count,
            destination_vertices_id: temp.destination_vertices_id,
            source_vertices_id: temp.source_vertices_id,
            is_hurry: temp.is_hurry,
            genders: temp.genders);
        // print(result);
        return result;
      } else {
        dynamic temp = response.data;
        // print(response.statusCode);
        ErrorModel result = ErrorModel(error: temp['error']);
        return result;
      }
    } catch (e) {
      ExceptionModel result = ExceptionModel(excption: e.toString());

      return result;
    }
  }
}
