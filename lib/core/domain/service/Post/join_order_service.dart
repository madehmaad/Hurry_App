import 'package:dio/dio.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/error_model.dart';
import 'package:hurry_project/core/domain/model/exception_model.dart';
import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/model/response_model/join_order_model.dart';
import 'package:hurry_project/core/domain/service/Data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic res = '';

class JoinOrderService extends Service {
  Future<Model> joinOrder({required JoinOrderModel model}) async {
    try {
      response =
          await dio.post('https://render-qdcy.onrender.com/api/orders/join',
              data: model.toJson(),
              options: Options(headers: {
                "Authorization": "Bearer  " +
                    config.get<SharedPreferences>().getString('token')!
              }));
      if (response.statusCode == 200) {
        Map<String, dynamic> temp = response.data;
        OrdersModel result = OrdersModel(
          id: temp['id'],
          top_passenger_count: temp['top_passenger_count'],
          current_passenger_count: temp['current_passenger_count'],
          destination_vertices_id: temp['destination_vertices_id'],
          source_vertices_id: temp['source_vertices_id'],
          is_hurry: temp['is_hurry'],
          genders: temp['genders'],
        );
        print(result);
        return result;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> temp = response.data;
        // print(response.statusCode);
        ErrorModel result = ErrorModel(error: temp['massage']);
        res = result;
        print(result);
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
